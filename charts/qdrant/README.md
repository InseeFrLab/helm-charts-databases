# qdrant

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.13.2](https://img.shields.io/badge/AppVersion-1.13.2-informational?style=flat-square)

Qdrant - Vector Database for the next generation of AI applications.

**Homepage:** <https://qdrant.tech>

## Source Code

* <https://github.com/qdrant/qdrant>
* <https://github.com/qdrant/qdrant-helm>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://qdrant.github.io/qdrant-helm | qdrant | 1.13.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| qdrant.additionalLabels | object | `{}` |  |
| qdrant.additionalVolumeMounts | list | `[]` |  |
| qdrant.additionalVolumes | list | `[]` |  |
| qdrant.affinity | object | `{}` |  |
| qdrant.apiKey | string | `""` |  |
| qdrant.args[0] | string | `"./config/initialize.sh"` |  |
| qdrant.config.cluster.consensus.tick_period_ms | int | `100` |  |
| qdrant.config.cluster.enabled | bool | `true` |  |
| qdrant.config.cluster.p2p.port | int | `6335` |  |
| qdrant.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| qdrant.containerSecurityContext.privileged | bool | `false` |  |
| qdrant.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| qdrant.containerSecurityContext.runAsGroup | int | `2000` |  |
| qdrant.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| qdrant.containerSecurityContext.runAsUser | int | `1000` |  |
| qdrant.env | object | `{}` |  |
| qdrant.fullnameOverride | string | `"qdrant"` |  |
| qdrant.image.pullPolicy | string | `"IfNotPresent"` |  |
| qdrant.image.repository | string | `"docker.io/qdrant/qdrant"` |  |
| qdrant.image.tag | string | `"v1.13.2-gpu-nvidia"` |  |
| qdrant.image.useUnprivilegedImage | bool | `false` |  |
| qdrant.imagePullSecrets | list | `[]` |  |
| qdrant.ingress.additionalLabels | object | `{}` |  |
| qdrant.ingress.annotations | object | `{}` |  |
| qdrant.ingress.enabled | bool | `false` |  |
| qdrant.ingress.hosts[0].host | string | `"example.com"` |  |
| qdrant.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| qdrant.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| qdrant.ingress.hosts[0].paths[0].servicePort | int | `6333` |  |
| qdrant.ingress.ingressClassName | string | `""` |  |
| qdrant.ingress.tls | list | `[]` |  |
| qdrant.lifecycle.preStop.exec.command[0] | string | `"sleep"` |  |
| qdrant.lifecycle.preStop.exec.command[1] | string | `"3"` |  |
| qdrant.livenessProbe.enabled | bool | `false` |  |
| qdrant.livenessProbe.failureThreshold | int | `6` |  |
| qdrant.livenessProbe.initialDelaySeconds | int | `5` |  |
| qdrant.livenessProbe.periodSeconds | int | `5` |  |
| qdrant.livenessProbe.successThreshold | int | `1` |  |
| qdrant.livenessProbe.timeoutSeconds | int | `1` |  |
| qdrant.metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| qdrant.metrics.serviceMonitor.enabled | bool | `false` |  |
| qdrant.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| qdrant.metrics.serviceMonitor.relabelings | list | `[]` |  |
| qdrant.metrics.serviceMonitor.scrapeInterval | string | `"30s"` |  |
| qdrant.metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| qdrant.metrics.serviceMonitor.targetPath | string | `"/metrics"` |  |
| qdrant.metrics.serviceMonitor.targetPort | string | `"http"` |  |
| qdrant.nameOverride | string | `""` |  |
| qdrant.nodeSelector | object | `{}` |  |
| qdrant.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| qdrant.persistence.annotations | object | `{}` |  |
| qdrant.persistence.size | string | `"10Gi"` |  |
| qdrant.persistence.storageVolumeName | string | `"data"` |  |
| qdrant.podAnnotations | object | `{}` |  |
| qdrant.podDisruptionBudget.enabled | bool | `false` |  |
| qdrant.podDisruptionBudget.maxUnavailable | int | `1` |  |
| qdrant.podDisruptionBudget.unhealthyPodEvictionPolicy | string | `""` |  |
| qdrant.podLabels | object | `{}` |  |
| qdrant.podManagementPolicy | string | `"Parallel"` |  |
| qdrant.podSecurityContext.fsGroup | int | `3000` |  |
| qdrant.podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| qdrant.priorityClassName | string | `""` |  |
| qdrant.readinessProbe.enabled | bool | `true` |  |
| qdrant.readinessProbe.failureThreshold | int | `6` |  |
| qdrant.readinessProbe.initialDelaySeconds | int | `5` |  |
| qdrant.readinessProbe.periodSeconds | int | `5` |  |
| qdrant.readinessProbe.successThreshold | int | `1` |  |
| qdrant.readinessProbe.timeoutSeconds | int | `1` |  |
| qdrant.replicaCount | int | `1` |  |
| qdrant.resources | object | `{}` |  |
| qdrant.service.additionalLabels | object | `{}` |  |
| qdrant.service.annotations | object | `{}` |  |
| qdrant.service.loadBalancerIP | string | `""` |  |
| qdrant.service.ports[0].checksEnabled | bool | `true` |  |
| qdrant.service.ports[0].name | string | `"http"` |  |
| qdrant.service.ports[0].port | int | `6333` |  |
| qdrant.service.ports[0].protocol | string | `"TCP"` |  |
| qdrant.service.ports[0].targetPort | int | `6333` |  |
| qdrant.service.ports[1].checksEnabled | bool | `false` |  |
| qdrant.service.ports[1].name | string | `"grpc"` |  |
| qdrant.service.ports[1].port | int | `6334` |  |
| qdrant.service.ports[1].protocol | string | `"TCP"` |  |
| qdrant.service.ports[1].targetPort | int | `6334` |  |
| qdrant.service.ports[2].checksEnabled | bool | `false` |  |
| qdrant.service.ports[2].name | string | `"p2p"` |  |
| qdrant.service.ports[2].port | int | `6335` |  |
| qdrant.service.ports[2].protocol | string | `"TCP"` |  |
| qdrant.service.ports[2].targetPort | int | `6335` |  |
| qdrant.service.type | string | `"ClusterIP"` |  |
| qdrant.serviceAccount.annotations | object | `{}` |  |
| qdrant.shareProcessNamespace | bool | `false` |  |
| qdrant.sidecarContainers | list | `[]` |  |
| qdrant.snapshotPersistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| qdrant.snapshotPersistence.annotations | object | `{}` |  |
| qdrant.snapshotPersistence.enabled | bool | `false` |  |
| qdrant.snapshotPersistence.size | string | `"10Gi"` |  |
| qdrant.snapshotRestoration.enabled | bool | `false` |  |
| qdrant.snapshotRestoration.mountPath | string | `"/qdrant/snapshot-restoration"` |  |
| qdrant.snapshotRestoration.pvcName | string | `"snapshots-pvc"` |  |
| qdrant.snapshotRestoration.snapshots | string | `nil` |  |
| qdrant.startupProbe.enabled | bool | `false` |  |
| qdrant.startupProbe.failureThreshold | int | `30` |  |
| qdrant.startupProbe.initialDelaySeconds | int | `10` |  |
| qdrant.startupProbe.periodSeconds | int | `5` |  |
| qdrant.startupProbe.successThreshold | int | `1` |  |
| qdrant.startupProbe.timeoutSeconds | int | `1` |  |
| qdrant.tolerations | list | `[]` |  |
| qdrant.topologySpreadConstraints | list | `[]` |  |
| qdrant.updateVolumeFsOwnership | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
