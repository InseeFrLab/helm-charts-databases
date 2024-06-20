# trino

![Version: 0.4.6](https://img.shields.io/badge/Version-0.4.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 449](https://img.shields.io/badge/AppVersion-449-informational?style=flat-square)

Fast distributed SQL query engine for big data analytics that helps you explore your data universe

**Homepage:** <https://trino.io/>

## Source Code

* <https://github.com/InseeFrLab/helm-charts-databases/tree/master/charts/trino>
* <https://github.com/InseeFrLab/trino/blob/main/Dockerfile>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://inseefrlab.github.io/helm-charts-interactive-services | library-chart | 1.5.23 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| accessControl | object | `{}` |  |
| additionalCatalogs | object | `{}` |  |
| additionalConfigProperties | object | `{}` |  |
| additionalExchangeManagerProperties | object | `{}` |  |
| additionalLogProperties | object | `{}` |  |
| additionalNodeProperties | object | `{}` |  |
| auth | object | `{}` |  |
| catalog.additionalCatalogs | list | `[]` |  |
| catalog.enabled | string | `nil` |  |
| commonLabels | object | `{}` |  |
| coordinator.additionalConfigFiles | object | `{}` |  |
| coordinator.additionalExposedPorts | object | `{}` |  |
| coordinator.additionalJVMConfig | object | `{}` |  |
| coordinator.affinity | object | `{}` |  |
| coordinator.annotations | object | `{}` |  |
| coordinator.config.memory.heapHeadroomPerNode | string | `""` |  |
| coordinator.config.query.maxMemoryPerNode | string | `"1GB"` |  |
| coordinator.jvm.gcMethod.g1.heapRegionSize | string | `"32M"` |  |
| coordinator.jvm.gcMethod.type | string | `"UseG1GC"` |  |
| coordinator.jvm.maxHeapSize | string | `"8G"` |  |
| coordinator.labels | object | `{}` |  |
| coordinator.livenessProbe | object | `{}` |  |
| coordinator.nodeSelector | object | `{}` |  |
| coordinator.readinessProbe | object | `{}` |  |
| coordinator.resources | object | `{}` |  |
| coordinator.secretMounts | list | `[]` |  |
| coordinator.tolerations | list | `[]` |  |
| coresite.secretName | string | `""` |  |
| discoverable.allow | bool | `true` |  |
| discovery.elastic | bool | `true` |  |
| discovery.hive | bool | `true` |  |
| discovery.mongodb | bool | `true` |  |
| discovery.opensearch | bool | `true` |  |
| discovery.postgres | bool | `true` |  |
| env | list | `[]` |  |
| envFrom | list | `[]` |  |
| eventListenerProperties | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"trinodb/trino"` |  |
| image.tag | int | `449` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| initContainers | object | `{}` |  |
| kafka.mountPath | string | `"/etc/trino/schemas"` |  |
| kafka.tableDescriptions | object | `{}` |  |
| networking.service.port | int | `8080` |  |
| networking.service.type | string | `"ClusterIP"` |  |
| resourceGroups | object | `{}` |  |
| route.annotations | list | `[]` |  |
| route.enabled | bool | `false` |  |
| route.hostname | string | `"chart-example.local"` |  |
| route.tls.termination | string | `"edge"` |  |
| route.wildcardPolicy | string | `"None"` |  |
| s3.accessKeyId | string | `""` |  |
| s3.configMapName | string | `""` |  |
| s3.defaultRegion | string | `""` |  |
| s3.enabled | bool | `true` |  |
| s3.endpoint | string | `""` |  |
| s3.secretAccessKey | string | `""` |  |
| s3.sessionToken | string | `""` |  |
| secretMounts | list | `[]` |  |
| security.allowlist.enabled | bool | `true` |  |
| security.allowlist.ip | string | `"0.0.0.0/0"` |  |
| security.networkPolicy.enabled | bool | `false` |  |
| security.networkPolicy.from | list | `[]` |  |
| security.password | string | `"changeme"` |  |
| security.username | string | `"admin"` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsUser | int | `1000` |  |
| server.autoscaling.behavior | object | `{}` |  |
| server.autoscaling.enabled | bool | `false` |  |
| server.autoscaling.maxReplicas | int | `5` |  |
| server.autoscaling.targetCPUUtilizationPercentage | int | `50` |  |
| server.config.authenticationType | string | `"PASSWORD"` |  |
| server.config.http.port | int | `8080` |  |
| server.config.https.enabled | bool | `false` |  |
| server.config.https.keystore.path | string | `""` |  |
| server.config.https.port | int | `8443` |  |
| server.config.path | string | `"/etc/trino"` |  |
| server.config.query.maxMemory | string | `"4GB"` |  |
| server.coordinatorExtraConfig | string | `""` |  |
| server.exchangeManager.baseDir | string | `"/tmp/trino-local-file-system-exchange-manager"` |  |
| server.exchangeManager.name | string | `"filesystem"` |  |
| server.log.trino.level | string | `"INFO"` |  |
| server.node.dataDir | string | `"/data/trino"` |  |
| server.node.environment | string | `"production"` |  |
| server.node.pluginDir | string | `"/usr/lib/trino/plugin"` |  |
| server.workerExtraConfig | string | `""` |  |
| server.workers | int | `2` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| shareProcessNamespace.coordinator | bool | `false` |  |
| shareProcessNamespace.worker | bool | `false` |  |
| sidecarContainers | object | `{}` |  |
| worker.additionalConfigFiles | object | `{}` |  |
| worker.additionalExposedPorts | object | `{}` |  |
| worker.additionalJVMConfig | object | `{}` |  |
| worker.affinity | object | `{}` |  |
| worker.annotations | object | `{}` |  |
| worker.config.memory.heapHeadroomPerNode | string | `""` |  |
| worker.config.query.maxMemoryPerNode | string | `"1GB"` |  |
| worker.jvm.gcMethod.g1.heapRegionSize | string | `"32M"` |  |
| worker.jvm.gcMethod.type | string | `"UseG1GC"` |  |
| worker.jvm.maxHeapSize | string | `"8G"` |  |
| worker.labels | object | `{}` |  |
| worker.livenessProbe | object | `{}` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.readinessProbe | object | `{}` |  |
| worker.resources | object | `{}` |  |
| worker.secretMounts | list | `[]` |  |
| worker.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
