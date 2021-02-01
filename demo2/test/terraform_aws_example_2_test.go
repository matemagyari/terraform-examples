package test

import (
	"fmt"
	"github.com/stretchr/testify/assert"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)


// An example of how to test the Terraform module in examples/terraform-aws-example using Terratest.
func TestTerraformAwsExample2(t *testing.T) {
	t.Parallel()

	expectedName := fmt.Sprintf("terratest-aws-example-%s", random.UniqueId())
	awsRegion := "us-west-2"
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/terraform-aws-example-2",
		Vars: map[string]interface{}{
			"instance_name": expectedName,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	instanceID := terraform.Output(t, terraformOptions, "instance_id")
	ip := terraform.Output(t, terraformOptions, "ip")

	fmt.Println("Instance id", instanceID)
	fmt.Println("IP", ip)

	assert.NotNil(t, instanceID)
	assert.NotNil(t, ip)
}
