data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] // Canonical
}

resource "aws_instance" "devopslabs01" {
  count                  = var.servers
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.devopslabs01.id
  key_name = "phlabs_root2"

  tags = {
    Name = "devopslabs01"
  }
}
