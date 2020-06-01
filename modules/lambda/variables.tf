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

variable "artifact-bucket-name" {
  description = "The lambda executable is stored in a bucket from another workspace."
  type = string
  default = ""
}

variable "website-bucket-name" {
  description = "Name the bucket where the lambda can upload a manifest for the job."
  type = string
  default = ""
}

variable "bin-name" {
  description = "The name of the executable the lambda will run."
  type = string
  default = ""
}

variable "api-name" {
  description = "Name the API for the lambda."
  type = string
  default = ""
}

variable "api-description" {
  description = "A brief description of the API for the console."
  type = string
  default = ""
}