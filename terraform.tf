terraform {
  backend "s3" {
    bucket = "naveen-tf-02"
    key = "naveenpc/terraform.tfstate"
    region = "us-east-1"
  }

}