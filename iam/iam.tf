resource "aws_iam_role" "role" {
  name = "${var.project_name}-${terraform.workspace}-${var.iam_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

tags = merge({ Environment = "${terraform.workspace}" }, var.common_tags)
}

# just for POC purpose, can be made to least privilaged with specific bucket ARN
resource "aws_iam_role_policy_attachment" "role-attach" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# just for POC purpose, can be made to least privilaged in real env
resource "aws_iam_role_policy_attachment" "role-attach1" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

