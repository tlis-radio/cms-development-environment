helm install postgres \
    --version=12.10.0 \
    --kube-context=docker-desktop \
    --namespace=postgres --create-namespace \
    --values=./postgres-values.yaml \
    --wait \
    oci://registry-1.docker.io/bitnamicharts/postgresql;