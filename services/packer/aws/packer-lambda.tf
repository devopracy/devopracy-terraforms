module "packer-lambda" {
  source = "../../../modules/lambda"
  service-name = var.service-name
  lambda-region = var.lambda-region
}