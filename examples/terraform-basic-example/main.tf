terraform {
  required_version = ">= 0.12.26"
}

// data sources allow retrieving data from the target of the provider
data "template_file" "hello_template" {
  template = file(var.template_file_path)
  vars = {
    first_name = var.first_name
    last_name = var.last_name
  }
}

locals {
  hello_content = "${data.template_file.hello_template.rendered}!"
}

// The resource block defines a piece of infrastructure
// local_file: resource type
// hello_file: resource name
resource "local_file" "hello_file" {
  content  = local.hello_content
  filename = "example.txt"
}