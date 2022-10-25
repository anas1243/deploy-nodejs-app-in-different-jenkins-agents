resource "aws_instance" "jenkins_master_and_slave" {
  ami                    = var.ami
  instance_type          = "t2.medium"
  subnet_id              = aws_subnet.public_subnet1.id
  key_name               = "gp_aws_key"
  vpc_security_group_ids = [aws_security_group.jenkins_master_and_slave_SG.id]
  provisioner "local-exec" {
    command = "echo '[jenkins_master_slave_containers]\n${self.public_ip}' > ../ansible/inventory"
  }

  tags = {
    Name = "${var.env}_jenkins_master_and_slave"
  }
}

resource "aws_instance" "jenkins_slave" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet2.id
  key_name               = "gp_aws_key"
  vpc_security_group_ids = [aws_security_group.jenkins_master_and_slave_SG.id]
  depends_on             = [aws_instance.jenkins_master_and_slave]
  provisioner "local-exec" {
    command = "echo '\n[jenkins_slave]\n${self.public_ip}' >> ../ansible/inventory"
  }
  tags = {
    Name = "${var.env}_jenkins_slave"
  }
}