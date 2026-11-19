{{/* vim: set filetype=mustache: */}}

{{/*
  Generates the CloudBeaver "initial data sources" configuration.

  Scans the secrets of the release namespace for the "onyxia/discovery"
  annotation (postgres, mariadb, trino) and builds a connection entry for
  each discoverable database.

  The whole configuration is built as a map and rendered with `toPrettyJson`,
  so every character in the discovered credentials is properly JSON-escaped.
*/}}
{{- define "discovery.secret" -}}
{{- $namespace := .Release.Namespace }}
{{- $connections := dict }}

{{- range $secret := (lookup "v1" "Secret" $namespace "").items }}
{{- $discoveryType := index ($secret.metadata.annotations | default dict) "onyxia/discovery" | default "" | toString }}

{{- if and $.Values.discovery.postgres (eq $discoveryType "postgres") }}
{{- $service := b64dec (index $secret.data "postgres-service" | default "") }}
{{- if $service }}
{{- $connections = merge $connections (dict $service (dict
      "provider" "postgresql"
      "driver" "postgres-jdbc"
      "name" (printf "PostgreSQL@%s" $service)
      "save-password" true
      "read-only" false
      "configuration" (dict
        "user" (b64dec (index $secret.data "postgres-username" | default ""))
        "password" (b64dec (index $secret.data "postgres-password" | default ""))
        "url" (printf "jdbc:postgresql://%s:%s/%s" $service (index $secret.data "postgres-port" | default "" | toString) (b64dec (index $secret.data "postgres-database" | default "")))
        "configurationType" "URL"
        "type" "dev"
        "provider-properties" (dict "@dbeaver-show-non-default-db@" "true")
        "auth-model" "native"))) }}
{{- end }}
{{- end }}

{{- if and $.Values.discovery.mariadb (eq $discoveryType "mariadb") }}
{{- $service := b64dec (index $secret.data "mariadb-service" | default "") }}
{{- if $service }}
{{- $connections = merge $connections (dict $service (dict
      "provider" "mysql"
      "driver" "mariaDB"
      "name" (printf "MariaDB@%s" $service)
      "save-password" true
      "read-only" false
      "configuration" (dict
        "user" (b64dec (index $secret.data "mariadb-username" | default ""))
        "password" (b64dec (index $secret.data "mariadb-password" | default ""))
        "url" (printf "jdbc:mariadb://%s:%s/%s" $service (index $secret.data "mariadb-port" | default "" | toString) (b64dec (index $secret.data "mariadb-database" | default "")))
        "configurationType" "URL"
        "type" "dev"
        "provider-properties" (dict "@dbeaver-show-non-default-db@" "true")
        "auth-model" "native"))) }}
{{- end }}
{{- end }}

{{- if and $.Values.discovery.trino (eq $discoveryType "trino") }}
{{- $service := b64dec (index $secret.data "trino-service" | default "") }}
{{- if $service }}
{{- $connections = merge $connections (dict $service (dict
      "provider" "generic"
      "driver" "trino_jdbc"
      "name" (printf "Trino@%s" $service)
      "save-password" true
      "read-only" false
      "configuration" (dict
        "user" (b64dec (index $secret.data "trino-username" | default ""))
        "password" (b64dec (index $secret.data "trino-password" | default ""))
        "url" (printf "jdbc:trino://%s:443/?SSL=true" $service)
        "configurationType" "URL"
        "type" "dev"
        "provider-properties" (dict "@dbeaver-show-non-default-db@" "true")
        "auth-model" "native"))) }}
{{- end }}
{{- end }}
{{- end }}

{{- $config := dict
  "folders" (dict)
  "connections" $connections
  "connection-types" (dict
    "dev" (dict
      "name" "development"
      "color" "255,255,255"
      "description" "Regular development database"
      "auto-commit" true
      "confirm-execute" false
      "confirm-data-change" false
      "auto-close-transactions" false)) }}
{{- $config | toPrettyJson }}
{{- end }}
