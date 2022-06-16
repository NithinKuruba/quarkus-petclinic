# Quarkus Petclinic Project

## Run Locally

```bash
./mvnw compile quarkus:dev
```
## Push New Image 

```bash
./mvnw package -DskipTests -Dquarkus.container-image.push=true
```

## Deploy to Kubernetes/Openshift

### Steps

- Login to Kubernetes or Openshift environment and switch to your namespace
- Update below yaml and create a secret

    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
      name: quarkus-petclinic-oidc-config
      namespace: <your_namespace>
    type: Opaque
    stringData:
      QUARKUS_OIDC_CLIENT_ID: <OIDC_CLIENT_ID>
      QUARKUS_OIDC_CREDENTIALS_SECRET: <OIDC_CLIENT_SECRET>
    ```

### Deploy apps

- Run `./deploy.sh` to deploy petclinic app

#### CI/CD

Future commits shall trigger git action `ci-build-deploy.yaml` to build latest artifacts and push it to quay.io and restart petclinic app with latest image