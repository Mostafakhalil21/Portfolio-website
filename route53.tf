resource "aws_route53_zone" "primary" {
  name = "aboutmostafa.com"
}

resource "aws_route53_record" "s3_bucket" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = ""  
  type    = "A"

  alias {
    name                   = "s3-website.eu-central-1.amazonaws.com"
    zone_id                = "Z21DNDUVLTQW6Q" 
    evaluate_target_health = false
  }
}