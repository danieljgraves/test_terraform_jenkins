resource "aws_route53_record" "site" {
  zone_id = "Z2SH507JHJ792W"
  name    = "site.dev.rig.net"
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.web.*.public_ip}"]
}
