{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "trino.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

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
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "trino.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

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
{{- end }}

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
{{- end }}


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
{{- end }}

{{/*
Selector labels
*/}}
{{- define "trino.selectorLabels" -}}
app.kubernetes.io/name: {{ include "trino.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

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

{{- define "connector.postgres" -}}
{{ $postgres:= .postgres }}
{{ $service:= .service }}
{{ $index:= .index }}
{{ $port:= .port }}
{{ $username:= .username }}
{{ $password:= .password }}
{{ $database:= .database }}
{{- if $postgres }}
{{- printf "postgresql%d.properties: |" $index | indent 2}}
    connector.name=postgresql
{{ printf "connection-url=jdbc:postgresql://%s:%s/%s"  $service $port $database | indent 4}}
{{ printf "connection-user=%s"  $username | indent 4}}
{{ printf "connection-password=%s" $password | indent 4}}
{{- end }}
{{- end -}}

{{- define "connector.hive" -}}
{{ $hive:= .hive }}
{{ $service:= .service }}
{{ $index:= .index }}
{{ $endpoint:= .endpoint}}
{{- if $hive  }}
{{- printf "hive.properties: |" | indent 2}}
    connector.name=hive
    hive.config.resources=/etc/trino/hdfs/core-site.xml
{{ printf "hive.metastore.uri=thrift://%s:9083" $service | indent 4}}
{{ printf "hive.s3.endpoint=%s" $endpoint | indent 4 }}
{{/*   hive.non-managed-table-writes-enabled=true */}} 
{{ printf "iceberg.properties: |" | indent 2}}
    connector.name=iceberg
    hive.config.resources=/etc/trino/hdfs/core-site.xml
{{ printf "hive.metastore.uri=thrift://%s:9083" $service | indent 4}}
{{ printf "hive.s3.endpoint=%s" $endpoint | indent 4 }}
{{/*   hive.non-managed-table-writes-enabled=true */}} 
{{ printf "deltalake.properties: |" | indent 2}}
    connector.name=delta-lake
    hive.config.resources=/etc/trino/hdfs/core-site.xml
{{ printf "hive.metastore.uri=thrift://%s:9083" $service | indent 4}}
{{ printf "hive.s3.endpoint=%s" $endpoint | indent 4 }}
{{/*   hive.non-managed-table-writes-enabled=true */}} 
{{- end }}
{{- end -}}

{{- define "connector.mongodb2" -}}
{{ $mongodb:= .mongodb }}
{{ $service:= .service }}
{{ $index:= .index }}
{{ $username:= .username }}
{{ $password:= .password }}
{{ $database:= .database }}
{{ $name:= .name }}
{{ if $mongodb }}
{{- printf "%s.properties: |" $name | indent 2}}
    connector.name=mongodb
{{ printf "mongodb.seeds=%s"  (join "," $service) | trim | indent 4}}
{{ printf "mongodb.credentials=%s:%s@%s" $username $password $database  | indent 4}}
{{- end -}}
{{- end -}}


{{- define "connector.elastic" -}}
{{ $elastic:= .elastic }}
{{ $service:= .service }}
{{ $index:= .index }}
{{ $port:= .port }}
{{- if $elastic }}
{{- printf "%s.properties: |" $service | indent 2}}
    connector.name=elasticsearch
{{ printf "elasticsearch.host=%s"  $service | indent 4}}
{{ printf "elasticsearch.port=%s"  $port | indent 4}}
{{ printf "elasticsearch.default-schema-name=%s" "default"| indent 4}}
{{- end }}
{{- end -}}