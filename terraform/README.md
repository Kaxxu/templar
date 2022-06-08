# Terraform Templar 

## Backend
The backend configuration for `Terraform statefile` are inside the file: `params/*.tfbackend`

```
terraform init -backend-config=params/templar.tfbackend -reconfigure
terraform plan -var-file=params/templar.tfvars
```

