output "jenkins_ip" {
  value = format("%s%s", aws_instance.jenkins_master.public_ip, "")
}

output "webserver_ip" {
  value = format("%s%s", aws_instance.flask_webapp.public_ip, "")
}