source ../../.env.local

sed \
    "s|{{ POSTGRES_CONNECTION_STRING }}|$POSTGRES_CONNECTION_STRING|g;
    s|{{ STORAGE_ACCOUNT_CONNECTION_STRING }}|$STORAGE_ACCOUNT_CONNECTION_STRING|g;
    s|{{ STORAGE_ACCOUNT }}|$STORAGE_ACCOUNT|g;" \
    ./values.yaml > ./values.tmp.yaml

helm upgrade cms-show-management \
  --kube-context docker-desktop \
  --install \
  --create-namespace --namespace cms-development \
  --values=./values.tmp.yaml \
  --wait \
  oci://tliscr.azurecr.io/helm/cms-show-management;
