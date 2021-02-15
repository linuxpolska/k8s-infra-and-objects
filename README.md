# Repo with manifest and terraform

## Terraform

Repository with terraform code.

### Structure

``` bash
.
├── DEV
│   ├── backend.tf
│   ├── main.tf
│   └── variables.tf
├── Module
│   └── GKE
│       ├── main.tf
│       └── variables.tf
└── PROD
    ├── backend.tf
    ├── main.tf
    └── variables.tf
```

### Usage

Repository use terrafroms backend files, so Cloud Storage is require.

``` bash
cd DEV # or PROD

terraform init
terraform apply \
-var="path=<path-to-credentional-file>" \
-var="project=<project-name>"
```


## Kustomize 

Related with LinuxPolska Blog Post.

### Structure

```bash
.
├── base
│   ├── deployment.yaml
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── service.yaml
├── dev
│   └── kustomization.yaml
└── prod
    ├── increase_replicas.yaml
    └── kustomization.yaml
```
    
### Usage 

After authentication to kubernetes cluster use

```bash
kubectl kustomize dev | k apply -f -
# or    
kubectl kustomize prod | k apply -f -
```

### Dry-run

In case of dry run type

```bash
kubectl kustomize dev 
# or
kubectl kustomize prod
```
