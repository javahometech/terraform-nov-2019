
//  render the template

data "template_file" "web_iam_policy" {
  template = file("scripts/web-iam-policy.json")
  vars = {
    bucket_name = var.ec2_bucket
  }
}

data "template_file" "iam_assume_role" {
  template = file("scripts/iam-assume-role.json")
  vars = {
    service_name = var.service_name
  }
}

// IAM policy for web ec2 instance

resource "aws_iam_policy" "web_policy" {
  name        = "s3_web_put_and_get-${terraform.workspace}"
  path        = "/javahome/"
  description = "my webapp policy"

  policy = data.template_file.web_iam_policy.rendered
}

// IAM Role for web

resource "aws_iam_role" "web_role" {
  name = "web_role-${terraform.workspace}"

  assume_role_policy = data.template_file.iam_assume_role.rendered
}

// Web attach role and policy

resource "aws_iam_role_policy_attachment" "web-attach" {
  role       = aws_iam_role.web_role.name
  policy_arn = aws_iam_policy.web_policy.arn
}

// Create EC2 instance profile 

resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = "ec2_javahome_profile-${terraform.workspace}"
  role = aws_iam_role.web_role.name
}