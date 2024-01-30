# main.tf

provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

provider "google" {
  credentials = file("<PATH_TO_GOOGLE_CREDENTIALS_JSON>")
  project     = "<YOUR_GOOGLE_PROJECT_ID>"
  region      = "us-central1"  # Set your desired GCP region
}

resource "google_compute_network" "example" {
  name = "example-network"
}

provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"  # Set your desired Azure region
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

output "aws_vpc_id" {
  value = aws_vpc.example.id
}

output "gcp_network_id" {
  value = google_compute_network.example.self_link
}

output "azure_vnet_id" {
  value = azurerm_virtual_network.example.id
}

