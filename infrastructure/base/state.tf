/*
 * state.tf
 * Generate a remote state bucket in S3 for use with later Terraform run
 * Uses a Turner created Terraform module; more information at:
 * https://github.com/turnerlabs/terraform-remote-state/blob/master/readme.md
 *
 * To learn more about remote state:
 * https://www.terraform.io/docs/state/remote.html
 */

# s3 bucket for tf remote state
module "tf_remote_state" {
  source = "github.com/turnerlabs/terraform-remote-state?ref=v2.2.0"

  role        = var.saml_role
  application = var.app
  tags        = var.tags
}

# Returns the name of the S3 bucket that will be used in later Terraform files
output "bucket" {
  value = module.tf_remote_state.bucket
}
