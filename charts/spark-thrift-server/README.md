# spark-thrift-server

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1](https://img.shields.io/badge/AppVersion-1-informational?style=flat-square)

Spark SQL can also act as a distributed query engine using its JDBC/ODBC or command-line interface.

**Homepage:** <https://spark.apache.org/>

## Source Code

* <https://github.com/InseeFrLab/images-datascience/blob/main/spark/Dockerfile>
* <https://github.com/InseeFrLab/helm-charts-databases/tree/master/charts/spark-thrift-server>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://inseefrlab.github.io/helm-charts-interactive-services | library-chart | 1.5.33 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| coresite.configMapName | string | `""` |  |
| discovery.enabled | bool | `true` |  |
| discovery.hive | bool | `true` |  |
| environment.s3 | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| hive.configMapName | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | list | `[]` |  |
| ingress.certManagerClusterIssuer | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.sparkHostname | string | `"chart-example-spark.local"` |  |
| ingress.tls | bool | `true` |  |
| ingress.useCertManager | bool | `false` |  |
| init.filename | string | `"onyxia-init.sh"` |  |
| init.standardInit | string | `"https://git.lab.sspcloud.fr/innovation/plateforme-onyxia/services-ressources/-/raw/master/onyxia-init.sh"` |  |
| kubernetes.enabled | bool | `true` |  |
| kubernetes.role | string | `"edit"` |  |
| nameOverride | string | `""` |  |
| networkPolicy.enabled | bool | `false` |  |
| networking.clusterIP | string | `"None"` |  |
| networking.port | int | `10000` |  |
| networking.sparkui.port | int | `4040` |  |
| networking.type | string | `"ClusterIP"` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| route.annotations | list | `[]` |  |
| route.enabled | bool | `false` |  |
| route.sparkHostname | string | `"chart-example-spark.local"` |  |
| route.tls.termination | string | `"edge"` |  |
| route.wildcardPolicy | string | `"None"` |  |
| s3.accessKeyId | string | `""` |  |
| s3.configMapName | string | `""` |  |
| s3.defaultRegion | string | `""` |  |
| s3.enabled | bool | `true` |  |
| s3.endpoint | string | `""` |  |
| s3.secretAccessKey | string | `""` |  |
| s3.sessionToken | string | `""` |  |
| security.allowlist.enabled | bool | `true` |  |
| security.allowlist.ip | string | `"0.0.0.0/0"` |  |
| security.networkPolicy.enabled | bool | `false` |  |
| security.networkPolicy.from | list | `[]` |  |
| security.password | string | `"changeme"` |  |
| securityContext | object | `{}` |  |
| service.image.custom.enabled | bool | `false` |  |
| service.image.custom.version | string | `"inseefrlab/onyxia-pyspark:py3.11.6-spark3.5.0"` |  |
| service.image.pullPolicy | string | `"IfNotPresent"` |  |
| service.image.version | string | `"inseefrlab/onyxia-pyspark:py3.11.6-spark3.5.0"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| spark.config."spark.dynamicAllocation.enabled" | string | `"true"` |  |
| spark.config."spark.dynamicAllocation.executorAllocationRatio" | string | `"1"` |  |
| spark.config."spark.dynamicAllocation.initialExecutors" | string | `"1"` |  |
| spark.config."spark.dynamicAllocation.maxExecutors" | string | `"10"` |  |
| spark.config."spark.dynamicAllocation.minExecutors" | string | `"1"` |  |
| spark.config."spark.dynamicAllocation.shuffleTracking.enabled" | string | `"true"` |  |
| spark.config."spark.kubernetes.authenticate.driver.serviceAccountName" | string | `"{{ include \"library-chart.fullname\" . }}"` |  |
| spark.config."spark.kubernetes.container.image" | string | `"{{ ternary .Values.service.image.custom.version .Values.service.image.version .Values.service.image.custom.enabled }}"` |  |
| spark.config."spark.kubernetes.driver.pod.name" | string | `"{{ include \"library-chart.fullname\" . }}-0"` |  |
| spark.config."spark.kubernetes.namespace" | string | `"{{ .Release.Namespace }}"` |  |
| spark.config."spark.master" | string | `"k8s://https://kubernetes.default.svc:443"` |  |
| spark.configMapName | string | `""` |  |
| spark.default | bool | `true` |  |
| spark.sparkui | bool | `true` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
