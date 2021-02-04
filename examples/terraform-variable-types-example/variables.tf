variable "example_string" {
  description = "Example variable that is a string."
  type        = string
  default     = "example"
}

variable "example_num" {
  description = "Example variable that is a number."
  type        = number
  default     = 1

  validation {
    condition     = var.example_num > 0
    error_message = "The number must be positive."
  }
}

variable "example_bool" {
  description = "Example variable that is a boolean."
  type        = bool
  default     = false
}

variable "example_list" {
  description = "An example variable that is a list."
  type        = list(string)
  default     = ["joe"]
}

variable "example_set" {
  description = "An example variable that is a set."
  type        = set(string)
  default     =  ["joe"]
}

variable "example_object" {
  description = "An example variable that is an object."
  type        = object({
    firstname = string
    lastname = string
  })

  default     =  {
    firstname = "Joe"
    lastname = "Biden"
  }
}

variable "example_map" {
  description = "An example variable that is a map."
  type        = map(string)
  default     = {
    "firstname": "joe",
    "lastname": "biden",
  }
}

variable "example_any" {
  description = "An example variable that is can be anything."
  type        = any
  default     = null
}
