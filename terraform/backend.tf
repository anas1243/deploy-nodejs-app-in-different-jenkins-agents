terraform {
  backend "s3" {
    bucket = "my-331389357704-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}