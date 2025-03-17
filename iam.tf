data "aws_caller_identity" "current" {}

data "aws_iam_openid_connect_provider" "oidc" {
  for_each = toset(data.aws_eks_cluster.k8s.identity[0].oidc[0].issuer)
  arn      = each.value
}

# resource "aws_iam_role" "app" {
#   name = local.app_role_name
#   assume_role_policy = jsonencode({
#     Version : "2012-10-17"
#     Statement : [
#       {
#         Effect : "Allow"
#         Principal : {
#           Federated : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.oidc_id}"
#         }
#         Action : "sts:AssumeRoleWithWebIdentity"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "app" {
#   role       = aws_iam_role.app.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }