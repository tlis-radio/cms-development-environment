ACR_NAME=tliscr
SERVICE_PRINCIPAL_NAME=acr-service-principal

ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

PASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)
USER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

echo "user_name: $USER_NAME"
echo "password: $PASSWORD"