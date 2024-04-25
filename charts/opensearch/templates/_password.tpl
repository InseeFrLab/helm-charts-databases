{{- define "opensearch.StrongPassword" -}}
{{- $strongPassword :=  (printf "%s%s"  .Values.security.password "aA0@") -}}
{{ $strongPassword := substr 1 (len $strongPassword) $strongPassword }}
{{- printf $strongPassword -}}
{{- end -}}


