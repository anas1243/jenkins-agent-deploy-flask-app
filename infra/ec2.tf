resource "aws_instance" "jenkins_master" {
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t2.micro"
  subnet_id              = module.network.public_subnet1_id
  key_name               = "gp_katoot"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = "${var.use_case}_master"
  }
  provisioner "local-exec" {
    command = "printf '%s\n' '[jenkins-master]' '${self.public_ip}' '' > ../ansible/inventory"
  }
}

resource "aws_instance" "flask_webapp" {
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t2.micro"
  subnet_id              = module.network.public_subnet2_id
  key_name               = "gp_katoot"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = "${var.use_case}_flask_webapp"
  }
  depends_on = [ aws_instance.jenkins_master ]
  provisioner "local-exec" {
    command = "printf '%s\n' '[jenkins-agent]' '${self.public_ip}' >> ../ansible/inventory"
   
  }
}