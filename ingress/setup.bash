helm install postgres \
    --version=12.6.0 \
    --kube-context=docker-desktop \
    --wait \
    oci://registry-1.docker.io/bitnamicharts/contour;