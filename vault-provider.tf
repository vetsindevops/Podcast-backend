#First stand up Vault or use the VetsInDevOps HCP Vault account (read SOP)

# Vault Provider
provider "vault" {
  address = "http://vault-server-address:8200"  # Update with your Vault server address
}

