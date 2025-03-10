{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "trino.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "trino.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "trino.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "trino.coordinator" -}}
{{- if .Values.coordinatorNameOverride }}
{{- .Values.coordinatorNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}-coordinator
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}-coordinator
{{- end }}
{{- end }}
{{- end -}}

{{- define "trino.worker" -}}
{{- if .Values.workerNameOverride }}
{{- .Values.workerNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}-worker
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}-worker
{{- end }}
{{- end }}
{{- end -}}

{{- define "trino.catalog" -}}
{{ template "trino.fullname" . }}-catalog
{{- end -}}

{{/*
Common labels
*/}}
{{- define "trino.labels" -}}
helm.sh/chart: {{ include "trino.chart" . }}
{{ include "trino.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "trino.selectorLabels" -}}
app.kubernetes.io/name: {{ include "trino.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
  Defines a discovery secret for given database.
  Example to expose the "hive" database, as defined in the "hive.properties" file:
    {{- include "trino.discovery-secret" (dict "context" . "database" "hive") -}}
*/}}
{{- define "trino.discovery-secret" }}
{{- $username := .context.Values.security.username }}
{{- $password := .context.Values.security.password }}
{{- $hostname := (.context.Values.ingress).enabled | ternary .context.Values.ingress.hostname .context.Values.route.hostname }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ printf "discoverable-%s-%s" (include "library-chart.fullname" .context) .database }}
  annotations:
    onyxia/discovery: "trino"
type: Opaque
data:
  trino-service:  {{ $hostname | b64enc | quote }}
  trino-password: {{ $password | b64enc | quote }}
  trino-username: {{ $username | b64enc | quote }}
  trino-port:     {{     "443" | b64enc | quote }}
  trino-database: {{ .database | b64enc | quote }}
---
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "trino.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "trino.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "debug.var_dump" -}}
{{- . | mustToPrettyJson | printf "\nThe JSON output of the dumped var is: \n%s" | fail }}
{{- end -}}

{{- define "connector.postgres" }}
  {{ .service }}.properties: |
    connector.name=postgresql
    connection-url={{ printf "jdbc:postgresql://%s:%s/%s" .service .port .database }}
    connection-user={{ .username }}
    connection-password={{ .password }}
{{- end -}}

{{- define "connector.hive" }}
  hive.properties: |
    connector.name=hive
    fs.hadoop.enabled=true
    hive.config.resources=/etc/trino/hdfs/core-site.xml
    hive.metastore.uri=thrift://{{ .service }}:9083
  iceberg.properties: |
    connector.name=iceberg
    fs.hadoop.enabled=true
    hive.config.resources=/etc/trino/hdfs/core-site.xml
    hive.metastore.uri=thrift://{{ .service }}:9083
  deltalake.properties: |
    connector.name=delta-lake
    fs.hadoop.enabled=true
    hive.config.resources=/etc/trino/hdfs/core-site.xml
    hive.metastore.uri=thrift://{{ .service }}:9083
{{- end -}}

{{- define "connector.mongodb2" }}
  {{ .name }}.properties: |
    connector.name=mongodb
    mongodb.seeds={{ join "," .service | trim }}
    mongodb.credentials={{ printf "%s:%s@%s" .username .password .database }}
{{- end -}}

{{- define "connector.elastic" }}
  {{ .name }}.properties: |
    connector.name=elasticsearch
    elasticsearch.host={{ .service }}
    elasticsearch.port={{ .port }}
    elasticsearch.default-schema-name={{ .schema }}
    elasticsearch.security={{ .security }}
    elasticsearch.auth.user={{ .username }}
    elasticsearch.auth.password={{ .password }}
    elasticsearch.tls.enabled={{ .tls }}
    elasticsearch.ignore-publish-address={{ .ignoreAddress }}
{{- end -}}

{{- define "connector.opensearch" }}
  {{ .name }}.properties: |
    connector.name=opensearch
    opensearch.host={{ .service }}
    opensearch.port={{ .port }}
    opensearch.default-schema-name={{ .schema }}
    opensearch.security={{ .security }}
    opensearch.auth.user={{ .username }}
    opensearch.auth.password={{ .password }}
    opensearch.tls.enabled={{ .tls }}
    opensearch.ignore-publish-address={{ .ignoreAddress }}
{{- end -}}
