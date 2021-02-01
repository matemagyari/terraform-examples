variable "example_string" {
  description = "Example variable"
  type        = string
  default     = "example"
}

variable "example_list" {
  description = "An example variable that is a list."
  type        = list(string)
  default     = []
}

variable "example_map" {
  description = "An example variable that is a map."
  type        = map(string)
  default     = {}
}

variable "example_any" {
  description = "An example variable that is can be anything"
  type        = any
  default     = null
}
