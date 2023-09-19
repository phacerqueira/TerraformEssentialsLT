variable "servers" {
    default = 1  
}

variable "meuip" {
    default = ["177.104.93.132/32","186.233.45.39/32"] //IP público autorizado na regra de entrada do Security Group
}