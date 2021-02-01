package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"net/http"
	"testing"
)

func TestDockerExample(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/terraform-docker-example",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	resp, _ := http.Get("http://localhost:8000")
	defer resp.Body.Close()

	assert.Equal(t, 200, resp.StatusCode)


}
