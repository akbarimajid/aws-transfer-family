variable "user_map" {
  type = map(string)
  default = {
    exampleuser1 = "ssh-rsa XXXXXXXXXX"
    exampleuser2 = "ssh-rsa YYYYYYYYYY"
  }
}


