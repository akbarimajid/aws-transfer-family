variable "user_map" {
  type = map(string)
  default = {
    exampleuser1 = "ssh-rsa XXXXXXXXXX"
    exampleuser2 = "ssh-rsa YYYYYYYYYY"
  }
}

variable "sftp_server_id" {
  default = "s-3bf58a5dbe854124a"
}

variable "s3_bucket_arn" {
  default = "arn:aws:s3:::agencies-sftp-bucket"
}

