# Use the vault data source in your Terraform configuration to retrieve the Google Cloud credentials

data "vault_generic_secret" "google_credentials" {
  path = "secret/data/google_credentials"
}

provider "google" {
  credentials = data.vault_generic_secret.google_credentials.data["data"]["credentials"]
  project     = "<YOUR_GOOGLE_PROJECT_ID>"
  region      = "us-central1"
}

