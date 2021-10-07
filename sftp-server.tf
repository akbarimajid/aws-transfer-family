resource "aws_transfer_server" "sftp" {
  identity_provider_type = "SERVICE_MANAGED"

  logging_role = aws_iam_role.sftp-log-role.arn

  tags = {
    owner = "majid"
  }
}

resource "aws_iam_role" "sftp-log-role" {
  name = "sftp-log-role"

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
  role = aws_iam_role.sftp-log-role.id

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

resource "aws_s3_bucket" "sftp-bucket" {
  bucket = "agencies-sftp-bucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name       = "agencies-sftp-bucket"
    owner = "majid"
  }
}

resource "aws_s3_bucket_public_access_block" "sftp-bucket_access" {
  bucket = aws_s3_bucket.sftp-bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

data "aws_route53_zone" "selected" {
  name         = "aws01.projectbox.cloud."
  private_zone = false
}

resource "aws_route53_record" "sftpserver" {

  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "majid-sftp.aws01.projectbox.cloud"
  type    = "CNAME"
  ttl     = "300"

  records = [aws_transfer_server.sftp.endpoint]

}

module "sftpusers" {
  for_each = var.user_map
  source = "./modules/aws-sftp-user"

  username       = each.key
  sshkey         = each.value
  s3_bucket_arn  = aws_s3_bucket.sftp-bucket.arn
  s3_bucket_name = aws_s3_bucket.sftp-bucket.id
  sftp_server_id = aws_transfer_server.sftp.id
}