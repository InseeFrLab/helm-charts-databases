from opensearchpy import OpenSearch
host = "opensearch-cluster-master"
port = 9200
# Create the client with SSL/TLS and hostname verification disabled.
client = OpenSearch(
    hosts = [{'host': host, 'port': port}],
    http_auth = ('admin','htlrfmiydnnpkd5p7fyaA0'),
    use_ssl = False
)
index_name = 'python-test-index'
index_body = {
    'settings': {
        'index': {
            'number_of_shards': 4
        }
    }
}
print("Ok so far")
response = client.indices.create(index_name, body=index_body)
