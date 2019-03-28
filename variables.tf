variable "token" {
  type        = "string"
  description = "token for github api"
}

variable "repo" {
  type        = "string"
  description = "Repository for realease OWNER/REPOSITORY"
}

variable "file" {
  description = "file needed for download"
}

variable "output_floader" {
  description = "where file has been downloaded"
  default     = "/tmp"
}

variable "tag" {
  description = "tag for download"
}
