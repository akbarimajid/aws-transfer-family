variable "user_map" {
  type = map(string)
  default = {
    majid  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDiX6+lFHzjRRiH6ADavhjCGAGnGssYN1h0rJawXygDLnLSIu+fPtYZ/1mtmVRlJ/1jIkJtYmOrCDjhleuHocb4FLF3K8896TnaFq0w6SAOwykpwcyqbiDWpDU6f6En2PlwQLSVRLdJMbw7AOPqSnMu6DB7yPnoqQ0tFvj0tzBFHZjzCDU9J51V7werFaf3eCMc2Oh8jgr2Z+xdGf3Fuhmrj0jvbJjNy0JjYhEkIOZViugOjPOHPvnMKrRSV2Y3H0yTIO90A8Xw+l6jxzo2nzRBnA+axRfkAgtFPKvlB9VodWuMA+yxdXa0/CiaLz4JW4hjVhhPaQfJZDbcuTjH6nk4WoF4d+QZiuutuJOB8jl9yXVfGjgqheZywqqDYO3KulnP2ARRyBmD1LDBm1C7hYoh30z8zpErcsr/ZGnNGAmyxn6Kp8LtlnbPgH2Sl/7L+ON7Npavdq4iWDnol2pC26Rb2UaGZ9v2Pwjf9mfM/0nlBvLR/YhApEPILZJewm7SKY85VdvgdWTRUdRL5XsZSm4kxJDdp2bOt9IUAhcBe7rhjUwcMeDwr8p2X8XNQK2U1rpSre22O+bkY5aMT30PBZNQczJGMdoqHtYWkUUJP2/hZni0PWUrFAeyr+82fJuxxFvkbV4xoUsakxTk6oLUDOb/60sCOMBb6qmQRi0HrBVbPQ== root@ip-172-31-10-30.us-east-2.compute.internal"
    exampleuser2 = "ssh-rsa YYYYYYYYYY"
  }
}

variable "sns_topic_arn" {
  default = "arn:aws:sns:eu-west-1:939595455984:Default_CloudWatch_Alarms_Topic" 
}