# variables.tf

variable "aws_credentials_path" {
  description = "Path to the AWS credentials JSON file"
  type        = string
  default     = "path/to/your/credentials.json"
}


variable "Azure_credentials_path" {
  description = "Path to the Google Cloud credentials JSON file"
  type        = string
  default     = "path/to/your/credentials.json"
}


variable "google_credentials_path" {
  description = "Path to the Google Cloud credentials JSON file"
  type        = string
  default     = "path/to/your/credentials.json"
}

