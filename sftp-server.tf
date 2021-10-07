resource "aws_transfer_server" "sftp" {
  identity_provider_type = "SERVICE_MANAGED"

  logging_role = aws_iam_role.sftp-logging.arn

  tags = {
    owner = "majid"
  }
}

resource "aws_iam_role" "sftp-logging" {
  name = "sftp-logging-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF

  tags = {
    Name       = "sftp-transfer-logging-role"
    owner = "majid"
  }
}

resource "aws_iam_role_policy" "sftp-logging" {
  name = "sftp-logging-policy"
  role = aws_iam_role.sftp-logging.id
  tags = {
    owner = "majid"
  }
  
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
POLICY

}

resource "aws_s3_bucket" "sftp" {
  bucket = "agencies"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name       = "agencies"
    owner = "majid"
  }
}

resource "aws_route53_record" "sftpserver" {

  zone_id = aws_route53_zone.primary.zone_id
  name    = "majid-sftp.aws01.projectbox.cloud"
  type    = "CNAME"
  ttl     = "300"

  records = [aws_transfer_server.sftp.endpoint]
  tags = {
    owner = "majid"
  }
}