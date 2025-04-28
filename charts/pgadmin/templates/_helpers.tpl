{{/* vim: set filetype=mustache: */}}

{{- define "pgadmin.servers" -}}
{{ printf "{" }}
{{ printf "\"Servers\": {" | indent 2 }}
{{- $virgule := 0 }}
{{- $namespace:= .Release.Namespace }}
{{- range $index, $secret := (lookup "v1" "Secret" $namespace "").items }}
{{- if (index $secret "metadata" "annotations") }}
{{- if and (index $secret "metadata" "annotations" "onyxia/discovery") (eq "postgres" (index $secret "metadata" "annotations" "onyxia/discovery" | toString)) }}
{{- $service:= ( index $secret.data "postgres-service" | default "") | b64dec  }}
{{- $username:= ( index $secret.data "postgres-username") | b64dec  }}
{{- $database:= ( index $secret.data "postgres-database") | b64dec  }}
{{- $port:= ( index $secret.data "postgres-port")  }}
{{- if $virgule }}
{{ printf "," }}
{{- end }}
{{ printf "\"%d\" :{" $index | indent 4}}
{{ printf "\"Name\": \"%s\"," $service | indent 6}}
{{ printf "\"Group\": \"Autodiscovery\"," | indent 6}}
{{ printf "\"Port\": %d," (int $port) | indent 6}}
{{ printf "\"Host\": \"%s\"," $service | indent 6}}
{{ printf "\"Username\": \"%s\"," $username | indent 6}}
{{ printf "\"SSLMode\": \"prefer\"," | indent 6 }}
{{ printf "\"MaintenanceDB\": \"%s\"," $database | indent 6}}
{{ printf "\"PassFile\": \"/pgpass.conf\"," | indent 6}}
{{ printf "\"SavePassword\": true" | indent 6}}
{{- $virgule = 1}}
{{ printf "}" | indent 4}}
{{- end }}
{{- end }}
{{- end }}
{{ printf "}" | indent 2}}
{{ printf "}" }}
{{- end -}}


{{- define "pgadmin.pgpass" -}}
# hostname:port:database:username:password
{{ $namespace:= .Release.Namespace -}}
{{- range $index, $secret := (lookup "v1" "Secret" $namespace "").items -}}
{{- if (index $secret "metadata" "annotations") -}}
{{- if and (index $secret "metadata" "annotations" "onyxia/discovery") (eq "postgres" (index $secret "metadata" "annotations" "onyxia/discovery" | toString)) -}}
{{- $service := ( index $secret.data "postgres-service" | default "") | b64dec  -}}
{{- $username:= ( index $secret.data "postgres-username") | b64dec  -}}
{{- $database:= ( index $secret.data "postgres-database") | b64dec  -}}
{{- $password:= ( index $secret.data "password") | b64dec  -}}
{{- $port    := ( index $secret.data "postgres-port")  -}}
{{- printf "%s:%s:%s:%s:%s" $service $port $database $username $password }}
{{ end -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "pgadmin.cleanemail" -}}
{{ printf "%s" .Values.security.mail  |  replace "@" "_"}}
{{- end -}}
