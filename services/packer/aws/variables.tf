variable "service-name" {
  description = "Name the service running on the lambda."
  type = string
  default = ""
}

variable "lambda-region" {
  description = "Deploy the lambda to this region."
  type = string
  default = ""
}

// The artifact bucket isn't created as part of the lambda, but
// exists in a project workspace. This is so that we can put up and
// tear down the lambda without affecting the storage.
variable "artifact-bucket-name" {
  description = "Name the bucket where the executable is stored."
  type = string
  default = ""
}

// When the lambda kicks off, the executable will generate a manifest and push
// it to a bucket where dev can see the results and metadata for the job.
variable "website-bucket-name" {
  description = "Name the bucket where the lambda can upload a manifest for the job."
  type = string
  default = ""
}

variable "bin-name" {
  description = "Name the executable the lambda will run."
  type = string
  default = ""
}