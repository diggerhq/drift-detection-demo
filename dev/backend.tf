terraform {
  backend "s3" {
    bucket         = "digger-terraform-state-209539466991"
    region         = "us-east-1"
    dynamodb_table = "digger-terraform-state-lock"
    key            = "drift-detection-demo-state-dev"
  }
}
