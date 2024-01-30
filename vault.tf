# Use the vault data source in your Terraform configuration to retrieve Cloud credentials. This is static see dynamic credentials for best practice 

data "vault_generic_secret" "google_credentials" {
  path = "secret/data/google_credentials"
}

data "vault_generic_secret" "aws_credentials" {
  path = "secret/data/aws-credentials"
}

provider "aws" {
  access_key = data.vault_generic_secret.aws_credentials.data["data"]["access_key"]
  secret_key = data.vault_generic_secret.aws_credentials.data["data"]["secret_key"]
  region     = data.vault_generic_secret.aws_credentials.data["data"]["region"]
}



provider "google" {
  alias       = "vault"
  credentials = data.vault_generic_secret.google_credentials.data["data"]["credentials"]
  project     = "<YOUR_GOOGLE_PROJECT_ID>"
  region      = "us-central1"
}

#The path parameter in the data "vault_generic_secret" block should point the creds in Vault
