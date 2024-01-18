resource "aws_instance" "main" {
  ami                    = data.aws_ssm_parameter.instance_ami.value
  instance_type          = "t3.micro"
  key_name               = "gmterraform"
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_vpc.main.default_security_group_id]

  tags = {
    "Name" = "${var.default_tags.env}-EC2-Instance"
  }
  user_data = base64encode(file("user.sh"))
}