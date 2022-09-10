variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["191.13.39.108/32"]
}

variable "key_name" {
  default = "terraform-alura"
}
