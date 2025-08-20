# Hosted Zone
import {
  to = module.route53.aws_route53_zone.custom_zone
  id = "Z00012362QX8RW3OBCG2J"
}

# Apex A
import {
  to = module.route53.aws_route53_record.apex_a
  id = "Z00012362QX8RW3OBCG2J_tien-cloud.com._A"
}

# Apex AAAA
import {
  to = module.route53.aws_route53_record.apex_aaaa
  id = "Z00012362QX8RW3OBCG2J_tien-cloud.com._AAAA"
}

# Wildcard A
import {
  to = module.route53.aws_route53_record.wildcard_a
  id = "Z00012362QX8RW3OBCG2J_*.tien-cloud.com._A"
}

# Wildcard AAAA
import {
  to = module.route53.aws_route53_record.wildcard_aaaa
  id = "Z00012362QX8RW3OBCG2J_*.tien-cloud.com._AAAA"
}

# API Gateway A
import {
  to = module.route53.aws_route53_record.api_alias_record
  id = "Z00012362QX8RW3OBCG2J_api.tien-cloud.com._A"
}

# ACM Validation CNAME
import {
  to = module.route53.aws_route53_record.acm_validation
  id = "Z00012362QX8RW3OBCG2J__5b7e76154189debbe2aca39252f05eb5.tien-cloud.com._CNAME"
}