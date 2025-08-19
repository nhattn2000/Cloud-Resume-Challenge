variable "domain_name" {
    type = string
}

variable "tags" {
  type = map(string)
  description = "Tag for Cloud Resume Project"
}
