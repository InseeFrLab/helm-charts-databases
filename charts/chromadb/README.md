# chromadb

![Version: 1.0.8](https://img.shields.io/badge/Version-1.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.3](https://img.shields.io/badge/AppVersion-0.6.3-informational?style=flat-square)

ChromaDB is an open-source vector database for storing, indexing, and querying high-dimensional embeddings efficiently.

**Homepage:** <https://www.trychroma.com/>

## Source Code

* <https://github.com/chroma-core/chroma>
* <https://github.com/amikos-tech/chromadb-chart/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://amikos-tech.github.io/chromadb-chart | chromadb | 0.1.23 |
| https://inseefrlab.github.io/helm-charts-interactive-services | library-chart | 1.7.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| chromadb.autoscaling.enabled | bool | `false` |  |
| chromadb.chromadb.apiVersion | string | `"0.6.3"` |  |
| chromadb.chromadb.auth.basic.password | string | `"changeme"` |  |
| chromadb.chromadb.auth.basic.username | string | `"chroma"` |  |
| chromadb.chromadb.auth.enabled | bool | `true` |  |
| chromadb.chromadb.auth.token.headerType | string | `"Authorization"` |  |
| chromadb.chromadb.auth.token.value | string | `"changeme"` |  |
| chromadb.chromadb.auth.type | string | `"basic"` |  |
| chromadb.chromadb.dataVolumeSize | string | `"1Gi"` |  |
| chromadb.chromadb.isPersistent | bool | `true` |  |
| chromadb.chromadb.serverHttpPort | int | `8000` |  |
| chromadb.fullnameOverride | string | `"chromadb"` |  |
| chromadb.image.pullPolicy | string | `"IfNotPresent"` |  |
| chromadb.image.repository | string | `"ghcr.io/chroma-core/chroma"` |  |
| chromadb.ingress.enabled | bool | `false` |  |
| chromadb.replicaCount | int | `1` |  |
| chromadb.savePersistentVolume | bool | `true` |  |
| chromadb.serviceAccount.create | bool | `false` |  |
| discovery.enabled | bool | `true` |  |
| ingress.annotations | list | `[]` |  |
| ingress.certManagerClusterIssuer | string | `""` |  |
| ingress.hostname | string | `"chart-example.local"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | bool | `true` |  |
| ingress.usecertManager | bool | `false` |  |
| route.annotations | list | `[]` |  |
| route.enabled | bool | `false` |  |
| route.hostname | string | `"chart-example.local"` |  |
| route.tls.termination | string | `"edge"` |  |
| route.wildcardPolicy | string | `"None"` |  |
| security.allowlist.enabled | bool | `false` |  |
| security.networkPolicy.enabled | bool | `false` |  |
| security.networkPolicy.from | list | `[]` |  |
| userPreferences.language | string | `"en"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
