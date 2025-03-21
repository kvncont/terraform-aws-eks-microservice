## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.91.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.91.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/ecr_repository) | resource |
| [aws_eks_pod_identity_association.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_role.app](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/resources/iam_role) | resource |
| [kubernetes_manifest.argocd_app](https://registry.terraform.io/providers/hashicorp/kubernetes/2.36.0/docs/resources/manifest) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.shared](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.shared](https://registry.terraform.io/providers/hashicorp/aws/5.91.0/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | The namespace where Argo CD is installed. | `string` | n/a | yes |
| <a name="input_arn_role"></a> [arn\_role](#input\_arn\_role) | The ARN of the role that will be assumed by the terraform user. | `string` | n/a | yes |
| <a name="input_backend_namespace"></a> [backend\_namespace](#input\_backend\_namespace) | The namespace of the backend services in Kubernetes. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The image tag mutability setting for the repository. | `string` | n/a | yes |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | Whether to enable the lifecycle policy for the ECR repository. | `bool` | n/a | yes |
| <a name="input_manifest_path"></a> [manifest\_path](#input\_manifest\_path) | The path within the Git repository to the Kubernetes manifests. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created. | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | The URL of the Git repository containing the Kubernetes manifests. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Whether to enable image scanning on push. | `bool` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | n/a | yes |
| <a name="input_waypoint_application"></a> [waypoint\_application](#input\_waypoint\_application) | Name of the application | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_arn"></a> [ecr\_repository\_arn](#output\_ecr\_repository\_arn) | The ARN of the ECR repository. |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the ECR repository. |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the ECR repository. |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The arn of the role. |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | The name of the role |
