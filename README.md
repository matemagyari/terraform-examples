# Terraform Examples

Examples demonstrating basic the features of Terraform. AWS-specific tests should be run
against either a real account, or Localstack.

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Install [Golang](https://golang.org/) and make sure this code is checked out into your `GOPATH`.
1. Run Localstack
    1. check out https://github.com/localstack/localstack
    1. Run `docker-compose-up`

Basic idea: a Terraform module is like a function (with side-effects). It has inputs ("variable"-s), outputs ("output"-s), and it creates some "resource"-s as side-effects.
