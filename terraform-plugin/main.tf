resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  count = 1
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${var.sub2}"
  tags {
        Name = "${var.hostname}"
        Role = "${var.role}"
        Environment = "${var.env}"
        Owner = "Daniel.Graves@rig.net"
        PrincipalId = "AIDAJQPTTLIJNWDTZJBBQ"
  }

  provisioner "remote-exec" {
    inline = [
	"sleep 10",
	"sudo apt-get -y update",
	"sudo apt-get -y update",
	"echo Installing system updates DONE!",
	"echo Proceeding to install Apache!",
	"sudo apt-get -y install apache2",
##	"sudo add-apt-repository -y ppa:certbot/certbot",
##	"sudo apt-get -y update",
##	"sudo apt-get -y install python-certbot-apache",
#	"sudo wget https://dl.eff.org/certbot-auto",
#	"sudo apt-get -y update",
#	"sudo chmod a+x ./certbot-auto",
##	"sudo ./certbot-auto certonly --apache --agree-tos --non-interactive --text --rsa-key-size 4096 --email daniel.graves@rig.net --webroot-path /var/www/html --domains \"site.dev.rig.net\""
    ]
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("~/.ssh/deploy.pem")}"
    }
  }

}
