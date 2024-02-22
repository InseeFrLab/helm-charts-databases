# nocodb

![Version: 1.2.1](https://img.shields.io/badge/Version-1.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

NocoDB is an open source NoCode platform that turns any database into a smart spreadsheet

**Homepage:** <https://www.nocodb.com/>

## Source Code

* <https://github.com/InseeFrLab/helm-charts-datascience/tree/master/charts/nocodb>
* <https://hub.docker.com/r/nocodb/nocodb>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.6.15 |
| https://inseefrlab.github.io/helm-charts-interactive-services | library-chart | 1.5.18 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| global.postgresql.auth.database | string | `"nocodb-metadata"` |  |
| global.postgresql.auth.password | string | `"changeme"` |  |
| global.postgresql.auth.username | string | `"admin"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | list | `[]` |  |
| ingress.certManagerClusterIssuer | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hostname | string | `"chart-example.local"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | bool | `true` |  |
| ingress.useCertManager | bool | `false` |  |
| nameOverride | string | `""` |  |
| networking.nocodb.port | int | `8080` |  |
| networking.service.port | int | `80` |  |
| networking.type | string | `"ClusterIP"` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.fullnameOverride | string | `"nocodb-pg"` |  |
| postgresql.image.tag | string | `"12"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| route.annotations | list | `[]` |  |
| route.enabled | bool | `false` |  |
| route.hostname | string | `"chart-example.local"` |  |
| route.tls.termination | string | `"edge"` |  |
| route.wildcardPolicy | string | `"None"` |  |
| security.allowlist.enabled | bool | `true` |  |
| security.allowlist.ip | string | `"0.0.0.0/0"` |  |
| security.mail | string | `"example@example.com"` |  |
| security.maxLoginAttempts | int | `999` |  |
| security.networkPolicy.enabled | bool | `false` |  |
| security.networkPolicy.from | list | `[]` |  |
| security.password | string | `"password"` |  |
| securityContext | object | `{}` |  |
| service.image.pullPolicy | string | `"Always"` |  |
| service.image.repository | string | `"nocodb/nocodb"` |  |
| service.image.tag | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)