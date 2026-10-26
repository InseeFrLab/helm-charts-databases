{{/* vim: set filetype=mustache: */}}

{{/* Ingress annotations */}}
{{- define "opensearch.ingress.annotations" -}}
{{- with .Values.ingress.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
nginx.ingress.kubernetes.io/whitelist-source-range: {{ .Values.security.allowlist.ip | quote }}
{{- end }}
{{- if .Values.ingress.useCertManager }}
cert-manager.io/cluster-issuer: {{ .Values.ingress.certManagerClusterIssuer | quote }}
acme.cert-manager.io/http01-ingress-class: {{ .Values.ingress.ingressClassName | quote }}
{{- end }}
{{- end }}

{{/* Ingress Dashboards annotations */}}
{{- define "opensearch.ingressDashboard.annotations" -}}
{{- with .Values.ingressDashboard.annotations }}
    {{- toYaml . }}
{{- end }}
{{- if .Values.security.allowlist.enabled }}
nginx.ingress.kubernetes.io/whitelist-source-range: {{ .Values.security.allowlist.ip | quote }}
{{- end }}
{{- if .Values.ingressDashboard.useCertManager }}
cert-manager.io/cluster-issuer: {{ .Values.ingressDashboard.certManagerClusterIssuer | quote }}
acme.cert-manager.io/http01-ingress-class: {{ .Values.ingressDashboard.ingressClassName | quote }}
{{- end }}
{{- end }}
