helm install rabbitmq \
    --namespace=cms-development --create-namespace \
    --kube-context=docker-desktop \
    --values=./rabbitmq-values.yaml \
    --wait \
    oci://registry-1.docker.io/bitnamicharts/rabbitmq 