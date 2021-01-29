package test

import (
	"fmt"
	"github.com/stretchr/testify/assert"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)


// An example of how to test the Terraform module in examples/terraform-aws-example using Terratest.
func TestTerraformAwsExample(t *testing.T) {
	t.Parallel()

	// Make a copy of the terraform module to a temporary directory. This allows running multiple tests in parallel
	// against the same terraform module.
	exampleFolder := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/terraform-aws-example")

	// Give this EC2 Instance a unique ID for a name tag so we can distinguish it from any other EC2 Instance running
	// in your AWS account
	expectedName := fmt.Sprintf("terratest-aws-example-%s", random.UniqueId())

	awsRegion := "us-east-1"

	// website::tag::1::Configure Terraform setting path to Terraform code, EC2 instance name, and AWS Region. We also
	// configure the options with default retryable errors to handle the most common retryable errors encountered in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleFolder,

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"instance_name": expectedName,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	})

	// website::tag::4::At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	instanceID := terraform.Output(t, terraformOptions, "instance_id")

	assert.NotNil(t, instanceID)
}
