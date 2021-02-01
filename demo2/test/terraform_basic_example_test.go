package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	expectedText := "Hello Joe Black!"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/terraform-basic-example",
		Vars: map[string]interface{}{
			"last_name": "Black",
		},
		VarFiles: []string{"varfile.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualTextExample := terraform.Output(t, terraformOptions, "hello_file_content")

	assert.Equal(t, expectedText, actualTextExample)
}
