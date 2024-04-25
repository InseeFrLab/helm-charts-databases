{{/* vim: set filetype=mustache: */}}

{{/* Route annotations */}}
{{- define "opensearch.route.annotations" -}}
{{- with .Values.route.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
haproxy.router.openshift.io/ip_whitelist: {{ .Values.security.allowlist.ip }}
{{- end }}
{{- end }}

{{/* Route Dashboard annotations */}}
{{- define "opensearch.routeDashboard.annotations" -}}
{{- with .Values.routeDashboard.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
haproxy.router.openshift.io/ip_whitelist: {{ .Values.security.allowlist.ip }}
{{- end }}
{{- end }}

{{/* Route hostname */}}
{{- define "opensearch.route.hostname" -}}
{{- if .Values.route.generate }}
{{- printf "%s" .Values.route.userHostname }}
{{- else }}
{{- printf "%s" .Values.route.hostname }}
{{- end }}
{{- end }}

{{/* Route Dashboard hostname */}}
{{- define "opensearch.routeDasboard.hostname" -}}
{{- if .Values.routeDashboard.generate }}
{{- printf "%s" .Values.routeDashboard.userHostname }}
{{- else }}
{{- printf "%s" .Values.routeDashboard.hostname }}
{{- end }}
{{- end }}
