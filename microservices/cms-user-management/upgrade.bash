source ../../.env.local

sed \
    "s|{{ POSTGRES_CONNECTION_STRING }}|$POSTGRES_CONNECTION_STRING|g;
    s|{{ STORAGE_ACCOUNT_CONNECTION_STRING }}|$STORAGE_ACCOUNT_CONNECTION_STRING|g;
    s|{{ STORAGE_ACCOUNT }}|$STORAGE_ACCOUNT|g;
    s|{{ AUTH0_DOMAIN }}|$AUTH0_DOMAIN|g;
    s|{{ AUTH0_CLIENT_ID }}|$AUTH0_CLIENT_ID|g;
    s|{{ AUTH0_CLIENT_SECRET }}|$AUTH0_CLIENT_SECRET|g;" \
    ./values.yaml > ./values.tmp.yaml

helm upgrade cms-user-management \
  --kube-context docker-desktop \
  --install \
  --create-namespace --namespace cms-development \
  --values=./values.tmp.yaml \
  --wait \
  oci://tliscr.azurecr.io/helm/cms-user-management;
