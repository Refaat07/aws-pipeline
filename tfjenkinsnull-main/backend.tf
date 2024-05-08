terraform {
  backend "s3" {
    bucket         = "terraform-mrefaat"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}
