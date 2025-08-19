resource "aws_instance" "tf-bs" {
  ami                         = data.aws_ami.ami.id
  instance_type               = var.bs_instance_type
  subnet_id                   = var.pub_a_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.sg_bs_id]

  tags = {
    Name = "bastion"
  }
}

