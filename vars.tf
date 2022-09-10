variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}