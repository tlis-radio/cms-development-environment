helm upgrade cms-api-gateway \
  --kube-context docker-desktop \
  --install \
  --create-namespace --namespace cms-development \
  --values=./values.yaml \
  --wait \
  oci://tliscr.azurecr.io/helm/cms-api-gateway;