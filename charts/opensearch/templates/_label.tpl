{{/* vim: set filetype=mustache: */}}

{{/*
Common labels
*/}}
{{- define "opensearch.labels" -}}
helm.sh/chart: {{ include "opensearch.chart" . }}
{{ include "opensearch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "opensearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opensearch.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
