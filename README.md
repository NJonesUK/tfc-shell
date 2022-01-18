# tfc-shell

This Terraform code will execute the contents of `recon.sh` whenever `terraform plan` or `terraform apply` is executed, using the `external` Terraform provider. It is designed to support offensive security testing against environments using Terraform Cloud, Terraform Enterprise, Atlantis, or other means of performing continuous deployment of infrastructure defined as Terraform.

## What will this do?

When run through `terraform plan` or `terraform apply`, the bash script will get executed. At present, it does the following:

* Some reconnaissance of the environment in which it's executing:
    * Get the OS, user, processes, file mounts
    * Print the environment variables
    * Check outbound connectivity (by curl-ing google)
    * Runs amicontained to enumerate any containerisation that's in place
* Credential grabbing, assuming one of the following:
    * It's executing inside AWS EC2, ECS, EKS or Cloud Shell
    * It's running somewhere with AWS credentials configured locally, in the `~/.aws/credentials` file.

Getting all this information back out of an environment to somewhere useful is left as an exercise to the reader, to raise the bar for threat actors wanting to take advantage of this project.

## Credits

* [Nick Frichette](https://twitter.com/frichette_n), for his documentation on code execution in Terraform targeting Terraform Enterprise - [https://hackingthe.cloud/terraform/terraform_enterprise_metadata_service/](https://hackingthe.cloud/terraform/terraform_enterprise_metadata_service/)
* [Alex Kaskasoli](https://twitter.com/_alxk), for identifying and documenting `terraform plan` as a vector that could be exploited for RCE
* [Amicontained](https://github.com/genuinetools/amicontained) for the container introspection feature
* [jq](https://github.com/stedolan/jq) for the necessary JSON construction to play nice with Terraform Cloud and Terraform Enterprise.