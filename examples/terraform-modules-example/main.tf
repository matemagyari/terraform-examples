module "webpages" {
  source = "./downloader"
  for_each = { for idx, url in var.urls: idx => url}
  url = each.value
  filename = "file${each.key}.html"
}