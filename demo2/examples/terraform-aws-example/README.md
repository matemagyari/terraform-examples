# Terraform AWS Example

## Running automated tests against this module

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Install [Golang](https://golang.org/) and make sure this code is checked out into your `GOPATH`.
1. Check out https://github.com/localstack/localstack
1. Run `docker-compose-up`
1. `cd test`
1. `dep ensure`
1. `go test -v -run TestTerraformAwsExample`
