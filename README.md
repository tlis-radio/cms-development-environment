# CMS Development Environment

## Prerequisites

- Helm cli
- [Docker](https://docs.docker.com/install/) with [Kubernetes](https://docs.docker.com/desktop/kubernetes/) configured.
    - login to tliscr.azurecr.io
```bash
docker login tliscr.azurecr.io
```
- [Helm](https://helm.sh/docs/intro/install/)
    - registry login to tliscr.azurecr.io
```bash
helm registry login tliscr.azurecr.io --username {username} --password {password}
```

## Setup

### 1. Create docker-registry secret

- run script and copy output values to next command
```bash
./service-principal.bash
```
- replace values user_name and password

```bash
kubectl create secret docker-registry acr-secret --context docker-desktop --namespace cms-development --docker-server=tliscr.azurecr.io --docker-username={user_name}  --docker-password={password}
```

### 2. Add host ``cms.api.local.development.tlis.sk`` to to hosts file

### 3. Create .env.local file in root of this repository and populate values

```
POSTGRES_CONNECTION_STRING=""
STORAGE_ACCOUNT_CONNECTION_STRING=""
STORAGE_ACCOUNT=""
AUTH0_CLIENT_ID=""
AUTH0_CLIENT_SECRET=""
```

### 4. Run deployment of all services to local k8s

```bash
./microservices/cms-api-gateway/upgrade.bash && \
./microservices/cms-show-gateway/upgrade.bash && \
./microservices/cms-user-gateway/upgrade.bash 
```