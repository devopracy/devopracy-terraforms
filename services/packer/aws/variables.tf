variable "service-name" {
  description = "The name of the service running on the lambda."
  type = string
  default = ""
}

variable "lambda-region" {
  description = "Deploy the lambda to this region."
  type = string
  default = ""
}