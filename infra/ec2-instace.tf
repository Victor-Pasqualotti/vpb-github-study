# To run it you need to cd C:\Dev\work\Terraform\terraform-manifests and the run commands in the terminal.
# 1) terraform init 
# 2) terraform validate
# 3) terraform plan -out=terraform-manifests-plan
# 4) terraform apply "terraform-manifests-plan"
# 5) terraform destroy -target aws_instance.example (pode usar apenas terraform destroy)

# EXAMPLE
# C:\Dev\work\Terraform\terraform-manifests>terraform init
# Initializing provider plugins found in the configuration...
# - Finding hashicorp/aws versions matching "~> 4.0"...
# - Installing hashicorp/aws v4.67.0...
# - Installed hashicorp/aws v4.67.0 (signed by HashiCorp)

# Initializing the backend...


# Terraform has created a lock file .terraform.lock.hcl to record the provider
# selections it made above. Include this file in your version control repository
# so that Terraform can guarantee to make the same selections by default when
# you run "terraform init" in the future.

# Terraform has been successfully initialized!

# You may now begin working with Terraform. Try running "terraform plan" to see
# any changes that are required for your infrastructure. All Terraform commands
# should now work.

# If you ever set or change modules or backend configuration for Terraform,
# rerun this command to reinitialize your working directory. If you forget, other
# commands will detect it and remind you to do so if necessary.

# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  profile = "default" # AWS Credentials profile configured in local desktop (aws cli)
  region = "sa-east-1"
}


# Resource Block
# For EC2 Instance Creation
# Go to EC2 > Instances > Launch Instances > Choose Amazon Machine Image (AMI) > Amazon Linux 2 AMI (HVM), SSD Volume Type
resource "aws_instance" "example" {
  ami           = "ami-0c51a6e57778d67c5" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExampleInstance"
  }
}