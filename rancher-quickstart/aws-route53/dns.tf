
data "aws_route53_zone" "root_zone" {
  name = var.rancher_route53_root_zone_name
}

resource "aws_route53_record" "rancher_prod" {
  zone_id = data.aws_route53_zone.root_zone.zone_id
  name    = var.rancher_route53_fqdn
  type    = "A"
  ttl     = "300"
  records = [aws_instance.rancher_server.public_ip]
}
