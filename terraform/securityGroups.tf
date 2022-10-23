resource "aws_security_group" "jenkins_master_and_slave_SG" {
  name        = "allow_Jenkins_master_and_slave"
  description = "Allow 8080, 5000, 3000, 22, and 80"
  vpc_id      = aws_vpc.iti_vpc.id

  tags = {
    Name = "${var.env}_jenkins_master_and_slave_SG"
  }
}
# allow all outbound traffic
resource "aws_security_group_rule" "engress_rule_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}

# allow inbound ssh from all
resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}

# allow inbound 8080 from all
resource "aws_security_group_rule" "ingress_8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}

# allow inbound 5000 from all
resource "aws_security_group_rule" "ingress_5000" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}

# allow inbound 3000 from all
resource "aws_security_group_rule" "ingress_3000" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}

# allow inbound 80 from all
resource "aws_security_group_rule" "ingress_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_master_and_slave_SG.id
}