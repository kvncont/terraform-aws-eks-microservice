## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.91.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.91.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/ecr_repository) | resource |
| [aws_eks_pod_identity_association.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_access_key.github_actions](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_access_key) | resource |
| [aws_iam_role.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_role) | resource |
| [aws_iam_role.ci](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ci_ecr_push_policy](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_user.github_actions](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_user) | resource |
| [aws_secretsmanager_secret.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/secretsmanager_secret) | resource |
| [github_actions_secret.access_key_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.account_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.secret_access_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_variable.ecr_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_actions_variable.iam_role_ci](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_actions_variable.region](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_repository.app](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [kubernetes_manifest.argocd_app](https://registry.terraform.io/providers/hashicorp/kubernetes/2.36.0/docs/resources/manifest) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.shared](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.shared](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/eks_cluster_auth) | data source |
| [github_repository.app](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_arn"></a> [assume\_role\_arn](#input\_assume\_role\_arn) | The ARN of the role that will be assumed by the terraform user. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | n/a | yes |
| <a name="input_create_gh_repo"></a> [create\_gh\_repo](#input\_create\_gh\_repo) | Whether to create a GitHub repository for the application or use an existing one. | `bool` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The image tag mutability setting for the repository. | `string` | n/a | yes |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | Whether to enable the lifecycle policy for the ECR repository. | `bool` | n/a | yes |
| <a name="input_manifest_path"></a> [manifest\_path](#input\_manifest\_path) | The path within the Git repository to the Kubernetes manifests. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace of the services in Kubernetes. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created. | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | The URL of the Git repository containing the Kubernetes manifests. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Whether to enable image scanning on push. | `bool` | n/a | yes |
| <a name="input_waypoint_application"></a> [waypoint\_application](#input\_waypoint\_application) | Name of the application | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_iam_role_arn"></a> [app\_iam\_role\_arn](#output\_app\_iam\_role\_arn) | The arn of the role. |
| <a name="output_app_iam_role_name"></a> [app\_iam\_role\_name](#output\_app\_iam\_role\_name) | The name of the role |
| <a name="output_ci_iam_role_arn"></a> [ci\_iam\_role\_arn](#output\_ci\_iam\_role\_arn) | The arn of the role. |
| <a name="output_ci_iam_role_name"></a> [ci\_iam\_role\_name](#output\_ci\_iam\_role\_name) | The name of the role |
| <a name="output_ecr_repository_arn"></a> [ecr\_repository\_arn](#output\_ecr\_repository\_arn) | The ARN of the ECR repository. |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the ECR repository. |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the ECR repository. |
