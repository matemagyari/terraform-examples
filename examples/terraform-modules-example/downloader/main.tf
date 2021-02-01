data "http" "http_get_result" {
  url = var.url
}

locals {
  result = data.http.http_get_result.body
}

resource "local_file" "hello_file" {
  content  = local.result
  filename = var.filename
}