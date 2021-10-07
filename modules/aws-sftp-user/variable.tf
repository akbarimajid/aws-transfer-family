variable "username" {
  default = ""
}

variable "sshkey" {
  default = ""
}
variable "sftp_server_id" {
  default = ""
}

variable "s3_bucket_arn" {
  default = ""
}

variable "s3_bucket_name" {
  default = ""
}

variable "sns_topic_arn" {
  default = "arn:aws:sns:eu-west-1:939595455984:Default_CloudWatch_Alarms_Topic" 
}