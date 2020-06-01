variable "lifecycle-bucket-name" {
  description = "When you need basic reaping in a bucket, use this one."
  type = string
  default = ""
}

variable "website-bucket-name" {
  description = "When making a bucket for a site, use this property."
  type = string
  default = ""
}

variable "kms-key-arn" {
  description = "The arn of the kms key to use to encrypt the bucket"
  type = string
  default = ""
}