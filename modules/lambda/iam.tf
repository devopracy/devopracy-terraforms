// Configure the AWS Provider
provider "aws" {
  region = var.lambda-region
}

// IAM ROLES AND POLICIES
// This doc allows lambda to take on the service building role.
data "aws_iam_policy_document" "service-role-doc" {

  version = "2012-10-17"
  statement {
    actions = [
      "sts:AssumeRole"]
    principals {
      identifiers = [
        "lambda.amazonaws.com"]
      type = "Service"
    }
  }
}

// This second doc has the permissions for ec2 we'll allow the lambda.
data "aws_iam_policy_document" "service-policy-doc" {

  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "ec2:AttachVolume",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:CopyImage",
      "ec2:CreateImage",
      "ec2:CreateKeypair",
      "ec2:CreateSecurityGroup",
      "ec2:CreateSnapshot",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:DeleteKeyPair",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteSnapshot",
      "ec2:DeleteVolume",
      "ec2:DeregisterImage",
      "ec2:DescribeImageAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:DescribeRegions",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSnapshots",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:DetachVolume",
      "ec2:GetPasswordData",
      "ec2:ModifyImageAttribute",
      "ec2:ModifyInstanceAttribute",
      "ec2:ModifySnapshotAttribute",
      "ec2:RegisterImage",
      "ec2:RunInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances"
    ]
    resources = ["*"]
  }
}

// Make a role for service and have it assume the role policy: lambda can do.
resource "aws_iam_role" "service-role" {
  name = "${var.service-name}-role"
  path = "/services/"
  assume_role_policy = data.aws_iam_policy_document.service-role-doc.json
}

// Write the permissions to a policy.
resource "aws_iam_policy" "service-policy" {
  name = "${var.service-name}-policy"
  description = "permissions for running ${var.service-name}"
  policy = data.aws_iam_policy_document.service-policy-doc.json
}

// Attach the permissions policy to the role.
resource "aws_iam_role_policy_attachment" "service-attach-role" {
  role = aws_iam_role.service-role.name
  policy_arn = aws_iam_policy.service-policy.arn
}
