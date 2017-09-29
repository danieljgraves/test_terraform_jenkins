resource "aws_route53_record" "site" {
  zone_id = "Z2SH507JHJ792W"
  name    = "site.dev.rig.net"
  type    = "A"
  ttl     = "60"
  records = ["13.59.44.2"]

#  provisioner "local-exec" {
#    command = "ssh -i ~/.ssh/deploy.pem -oStrictHostKeyChecking=no ubuntu@${aws_instance.web.private_ip} \"sudo ./certbot-auto certonly --apache --agree-tos --non-interactive --text --rsa-key-size 4096 --email daniel.graves@rig.net --webroot-path /var/www/html --domains \"site.dev.rig.net\"\""
#  }

}

