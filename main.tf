# main.tf

# AWS
provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "example-aws-bucket"
  acl    = "private"

  tags = {
    Name = "example-aws-bucket"
  }
}

# Azure
provider "azurerm" {
  # No need to explicitly specify the features block
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"  # Set your desired Azure region
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# GCP
provider "google" {
  credentials = file("<PATH_TO_GOOGLE_CREDENTIALS_JSON>")
  project     = "<YOUR_GOOGLE_PROJECT_ID>"
  region      = "us-central1"  # Set your desired GCP region
}

resource "google_storage_bucket" "example" {
  name     = "example-gcp-bucket"
  location = "US"
  storage_class = "STANDARD"

  labels = {
    environment = "production"
  }
}

output "aws_s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "azure_storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "gcp_storage_bucket_name" {
  value = google_storage_bucket.example.name
}

