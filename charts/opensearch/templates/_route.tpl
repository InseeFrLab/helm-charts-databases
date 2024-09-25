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
