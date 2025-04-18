# opensearch

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.19.0](https://img.shields.io/badge/AppVersion-2.19.0-informational?style=flat-square)

Opensearch provides a full-text search engine with an HTTP web interface and schema-free JSON documents.

**Homepage:** <https://opensearch.org/>

## Source Code

* <https://github.com/InseeFrLab/helm-charts-databases/tree/master/charts/opensearch>
* <https://github.com/opensearch-project/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://opensearch-project.github.io/helm-charts/ | opensearch | 2.31.0 |
| https://opensearch-project.github.io/helm-charts/ | opensearch-dashboards | 2.27.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| discovery.enabled | bool | `true` |  |
| ingress.annotations | list | `[]` |  |
| ingress.certManagerClusterIssuer | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hostname | string | `"chart-example.local"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | bool | `true` |  |
| ingress.useCertManager | bool | `false` |  |
| ingressDashboard.annotations | list | `[]` |  |
| ingressDashboard.certManagerClusterIssuer | string | `""` |  |
| ingressDashboard.enabled | bool | `false` |  |
| ingressDashboard.hostname | string | `"chart-example-dashboards.local"` |  |
| ingressDashboard.ingressClassName | string | `""` |  |
| ingressDashboard.tls | bool | `true` |  |
| ingressDashboard.useCertManager | bool | `false` |  |
| opensearch-dashboards.rbac.create | bool | `false` |  |
| opensearch-dashboards.service.port | int | `5601` |  |
| opensearch-dashboards.serviceAccount.create | bool | `false` |  |
| opensearch.envFrom[0].secretRef.name | string | `"opensearch-env-secret"` |  |
| opensearch.httpPort | int | `9200` |  |
| opensearch.networkPolicy.create | bool | `false` |  |
| opensearch.networkPolicy.http.enabled | bool | `false` |  |
| opensearch.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| opensearch.persistence.annotations | object | `{}` |  |
| opensearch.persistence.enableInitChown | bool | `true` |  |
| opensearch.persistence.enabled | bool | `true` |  |
| opensearch.persistence.labels.enabled | bool | `false` |  |
| opensearch.persistence.size | string | `"8Gi"` |  |
| opensearch.replicas | int | `3` |  |
| opensearch.resources.limits.cpu | string | `"1000m"` |  |
| opensearch.resources.limits.memory | string | `"10Gi"` |  |
| opensearch.resources.requests.cpu | string | `"1000m"` |  |
| opensearch.resources.requests.memory | string | `"100Mi"` |  |
| opensearch.securityConfig.enabled | bool | `true` |  |
| route.annotations | list | `[]` |  |
| route.enabled | bool | `false` |  |
| route.hostname | string | `"chart-example.local"` |  |
| route.tls.termination | string | `"edge"` |  |
| route.userHostname | string | `"chart-example-user.local"` |  |
| route.wildcardPolicy | string | `"None"` |  |
| routeDashboard.annotations | list | `[]` |  |
| routeDashboard.enabled | bool | `false` |  |
| routeDashboard.hostname | string | `"chart-example-dashboards.local"` |  |
| routeDashboard.tls.termination | string | `"edge"` |  |
| routeDashboard.userHostname | string | `"chart-example-user-dashboards.local"` |  |
| routeDashboard.wildcardPolicy | string | `"None"` |  |
| security.allowlist.enabled | bool | `false` |  |
| security.allowlist.ip | string | `"0.0.0.0/0"` |  |
| security.networkPolicy.enabled | bool | `false` |  |
| security.networkPolicy.from | list | `[]` |  |
| security.password | string | `"MyStr0ngP@ssword"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
