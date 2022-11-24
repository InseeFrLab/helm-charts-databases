{{/* vim: set filetype=mustache: */}}

{{- define "discovery.configmap" -}}
{{ printf "{" }}
{{ printf "\"folders\": {}," | indent 2}}
{{ printf "\"connections\": {" | indent 2}}
{{- $comma:= 0 }}
{{- $namespace:= .Release.Namespace }}
{{- range $index, $secret := (lookup "v1" "Secret" $namespace "").items }}
{{- if (index $secret "metadata" "annotations") }}
{{- if ( $.Values.discovery.postgres) -}}
{{- if and (index $secret "metadata" "annotations" "onyxia/discovery") (eq "postgres" (index $secret "metadata" "annotations" "onyxia/discovery" | toString)) }}
{{- $service:= ( index $secret.data "postgres-service" | default "") | b64dec  }}
{{- $username:= ( index $secret.data "postgres-username") | b64dec  }}
{{- $password:= ( index $secret.data "postgres-password") | b64dec  }}
{{- $database:= ( index $secret.data "postgres-database") | b64dec  }}
{{- $port:= ( index $secret.data "postgres-port" )  }}
{{- if $comma }}
{{ printf "," }}
{{- end }}
{{ printf "\"%s\": {" $service | indent 4 }}
{{ printf "\"provider\": \"postgresql\"," | indent 6 }}
{{ printf "\"driver\": \"postgres-jdbc\"," | indent 6 }}
{{ printf "\"name\": \"PostgreSQL@%s\"," $service | indent 6 }}
{{ printf "\"save-password\": true," | indent 6 }}
{{ printf "\"read-only\": false," | indent 6}}
{{ printf "\"configuration\": {" | indent 6 }}
{{ printf "\"user\": \"%s\"," $username | indent 8 }}
{{ printf "\"password\": \"%s\"," $password | indent 8 }}
{{ printf "\"url\": \"jdbc:postgresql://%s:%s/%s\"," $service $port $database | indent 8 }}
{{ printf "\"configurationType\": \"URL\"," | indent 8 }}
{{ printf "\"type\": \"dev\"," | indent 8 }}
{{ printf "\"provider-properties\": {" | indent 8}}
{{ printf "\"@dbeaver-show-non-default-db@\": \"true\"" | indent 10 }}
{{ printf "}," | indent 8}}
{{ printf "\"auth-model\": \"native\"" | indent 8 }}
{{ printf "}" | indent 6 }}
{{ printf "}" | indent 4 }}
{{- $comma = 1 }}
{{- end }}
{{- end }}
{{- if $.Values.discovery.mariadb }}
{{- if and (index $secret "metadata" "annotations" "onyxia/discovery") (eq "mariadb" (index $secret "metadata" "annotations" "onyxia/discovery" | toString)) }}
{{- $service:= ( index $secret.data "mariadb-service" | default "") | b64dec  }}
{{- $username:= ( index $secret.data "mariadb-username") | b64dec  }}
{{- $password:= ( index $secret.data "mariadb-password") | b64dec  }}
{{- $database:= ( index $secret.data "mariadb-database") | b64dec  }}
{{- $port:= ( index $secret.data "mariadb-port" )  }}
{{- if $comma }}
{{ printf "," }}
{{- end }}
{{ printf "\"%s\": {" $service | indent 4 }}
{{ printf "\"provider\": \"mysql\"," | indent 6 }}
{{ printf "\"driver\": \"mariaDB\"," | indent 6 }}
{{ printf "\"name\": \"MariaDB@%s\"," $service | indent 6 }}
{{ printf "\"save-password\": true," | indent 6 }}
{{ printf "\"read-only\": false," | indent 6}}
{{ printf "\"configuration\": {" | indent 6 }}
{{ printf "\"user\": \"%s\"," $username | indent 8 }}
{{ printf "\"password\": \"%s\"," $password | indent 8 }}
{{ printf "\"url\": \"jdbc:mariadb://%s:%s/%s\"," $service $port $database | indent 8 }}
{{ printf "\"configurationType\": \"URL\"," | indent 8 }}
{{ printf "\"type\": \"dev\"," | indent 8 }}
{{ printf "\"provider-properties\": {" | indent 8}}
{{ printf "\"@dbeaver-show-non-default-db@\": \"true\"" | indent 10 }}
{{ printf "}," | indent 8}}
{{ printf "\"auth-model\": \"native\"" | indent 8 }}
{{ printf "}" | indent 6 }}
{{ printf "}" | indent 4 }}
{{- $comma = 1 }}
{{- end }}
{{- end }}
{{- if $.Values.discovery.trino }}
{{- if and (index $secret "metadata" "annotations" "onyxia/discovery") (eq "trino" (index $secret "metadata" "annotations" "onyxia/discovery" | toString)) }}
{{- $service:= ( index $secret.data "trino-service" | default "") | b64dec  }}
{{- $username:= ( index $secret.data "trino-username") | b64dec  }}
{{- $password:= ( index $secret.data "trino-password") | b64dec  }}
{{- $database:= ( index $secret.data "trino-database") | b64dec  }}
{{- if $comma }}
{{ printf "," }}
{{- end }}
{{ printf "\"%s\": {" $service | indent 4 }}
{{ printf "\"provider\": \"generic\"," | indent 6 }}
{{ printf "\"driver\": \"trino_jdbc\"," | indent 6 }}
{{ printf "\"name\": \"Trino@%s\"," $service | indent 6 }}
{{ printf "\"save-password\": true," | indent 6 }}
{{ printf "\"read-only\": false," | indent 6}}
{{ printf "\"configuration\": {" | indent 6 }}
{{ printf "\"user\": \"%s\"," $username | indent 8 }}
{{ printf "\"password\": \"%s\"," $password | indent 8 }}
{{ printf "\"url\": \"jdbc:trino://%s:443/?SSL=true\"," $service | indent 8 }}
{{ printf "\"configurationType\": \"URL\"," | indent 8 }}
{{ printf "\"type\": \"dev\"," | indent 8 }}
{{ printf "\"provider-properties\": {" | indent 8}}
{{ printf "\"@dbeaver-show-non-default-db@\": \"true\"" | indent 10 }}
{{ printf "}," | indent 8}}
{{ printf "\"auth-model\": \"native\"" | indent 8 }}
{{ printf "}" | indent 6 }}
{{ printf "}" | indent 4 }}
{{- $comma = 1 }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
{{ printf "}," | indent 2 }}
{{ printf "\"connection-types\": {" | indent 2 }}
{{ printf "\"dev\": {" | indent 4 }}
{{ printf "\"name\": \"development\"," | indent 6}}
{{ printf "\"color\": \"255,255,255\"," | indent 6}}
{{ printf "\"description\": \"Regular development database\"," | indent 6}}
{{ printf "\"auto-commit\": true," | indent 6}}
{{ printf "\"confirm-execute\": false," | indent 6}}
{{ printf "\"confirm-data-change\": false," | indent 6}}
{{ printf "\"auto-close-transactions\": false" | indent 6}}
{{ printf "}" | indent 4 }}
{{ printf "}" | indent 2}}
{{ printf "}" }}
{{- end }}
