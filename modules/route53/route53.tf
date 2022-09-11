resource "aws_route53_zone" "private" {
  name = "geo-terraform-test.com"
}
resource "aws_route53_record" "instance-record" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "${var.wildcard}"
  type    = "A"
  ttl     = "300"
  records = [var.aws_instance[0]]
}