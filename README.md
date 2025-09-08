# Terraform Practice Repository

This repository contains multiple Terraform projects and modules for practicing Infrastructure as Code (IaC) concepts with AWS and local resources.

## 📂 Repository Structure

<!-- - **aws_IAM_management/**  
  Manage AWS IAM users and roles using YAML-based data sources.

- **aws-ec2/**  
  Provision and manage AWS EC2 instances.

- **aws-remote-state-management/**  
  Demonstrates remote state management using S3 and DynamoDB.

- **aws-s3/**  
  Create S3 buckets and upload objects.

- **aws-vpc/**  
  Practice VPC creation and networking (details inside folder).

- **tf-count/**  
  Examples using the `count` meta-argument.

- **tf-data-source/**  
  Use data sources to fetch information from providers.

- **tf-for_each/**  
  Examples using the `for_each` meta-argument. -->

- **tf-create-localFile/**  
  Create local files using the `local_file` resource.

- **tf-operators-expressions/**  
  Practice with Terraform operators and expressions.

- **tf-variables/**  
  Examples of variable usage in Terraform. 

<!-- - **tf-own-module-VPC/**  
  Custom VPC module for reusable infrastructure. -->

---

## 🚀 How to Use

Each folder is a standalone Terraform project.

To initialize and apply a project:

```sh
cd <project-folder>
terraform init
terraform plan
terraform apply
```

To destroy resources when done:

```sh
terraform destroy
```

---

## ✅ Requirements

- Terraform v1.3.0 or newer (Recommended)
- AWS CLI configured with valid credentials for AWS-related projects
- Access to AWS account with permissions for resources you plan to manage

---

## 🗂 Workspaces & Environment Structure

For multi-environment setups (e.g., dev, stage, prod), use Terraform workspaces or separate state files:

```sh
terraform workspace new dev
terraform workspace new prod
terraform workspace select dev
terraform apply
```

Recommended directory structure:

```
project/
├── main.tf
├── variables.tf
├── outputs.tf
├── env/
│   ├── dev.tfvars
│   ├── stage.tfvars
│   └── prod.tfvars
```

Apply with:

```sh
terraform apply -var-file="env/dev.tfvars"
```

---

## 📝 Notes

- Lock files (`.terraform.lock.hcl`) are managed automatically by Terraform.
- State files (`terraform.tfstate`, `terraform.tfstate.backup`) should **NOT** be manually edited.
- Example/demo files (like `demo.txt`) are provided for learning purposes only.
- For remote state, configure an S3 bucket and DynamoDB table before using.

---

## 📊 Diagrams

### AWS Remote State Architecture

```
+---------------------+
|   Terraform CLI     |
+---------+-----------+
          |
          v
+---------------------+       +----------------------+
| S3 Bucket (Backend) | <---- |   DynamoDB (Lock)    |
+---------------------+       +----------------------+
```
- S3 Bucket stores the state file
- DynamoDB enables state locking for team environments

### AWS VPC Architecture

```
+------------------------+
|        VPC             |
|  +-------+   +-------+ |
|  | Subnet|   | Subnet| |
|  +-------+   +-------+ |
|      |          |      |
|   EC2/ALB   RDS/Other  |
+------------------------+
```

---

## 📌 Best Practices

- Use variables and outputs for reusable code
- Leverage modules to avoid duplication
- Enable state locking with DynamoDB for team environments
- Always review the plan before applying changes:
  ```sh
  terraform plan
  ```
- Store sensitive variables in `.tfvars` files or use environment variables
- Use `terraform fmt` and `terraform validate` before committing