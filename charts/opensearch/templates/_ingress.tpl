{{/* vim: set filetype=mustache: */}}

{{/*
Returns true if the ingressClassname field is supported
Usage:
{{ include "common.ingress.supportsIngressClassname" . }}
*/}}
{{- define "opensearch.ingress.supportsIngressClassname" -}}
{{- if semverCompare "<1.18-0" (include "opensearch.capabilities.kubeVersion" .) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{/* Ingress annotations */}}
{{- define "opensearch.ingress.annotations" -}}
{{- with .Values.ingress.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
nginx.ingress.kubernetes.io/whitelist-source-range: {{ .Values.security.allowlist.ip }}
{{- end }}
{{- if .Values.ingress.useCertManager }}
cert-manager.io/cluster-issuer: {{ .Values.ingress.certManagerClusterIssuer }}
acme.cert-manager.io/http01-ingress-class: {{ .Values.ingress.ingressClassName }}
{{- end }}
{{- end }}

{{/* Ingress Dashboards annotations */}}
{{- define "opensearch.ingressDashboard.annotations" -}}
{{- with .Values.ingressDashboard.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
nginx.ingress.kubernetes.io/whitelist-source-range: {{ .Values.security.allowlist.ip }}
{{- end }}
{{- if .Values.ingressDashboard.useCertManager }}
cert-manager.io/cluster-issuer: {{ .Values.ingressDashboard.certManagerClusterIssuer }}
acme.cert-manager.io/http01-ingress-class: {{ .Values.ingressDashboard.ingressClassName }}
{{- end }}
{{- end }}

{{/* Ingress hostname */}}
{{- define "opensearch.ingress.hostname" -}}
{{- if .Values.ingress.generate }}
{{- printf "%s" .Values.ingress.userHostname }}
{{- else }}
{{- printf "%s" .Values.ingress.hostname }}
{{- end }}
{{- end }}

