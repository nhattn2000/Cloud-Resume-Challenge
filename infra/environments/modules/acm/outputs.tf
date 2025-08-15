output "cert_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.resume_acm.arn
}

output "cert_domain_name" {
  description = "Primary domain name of the certificate"
  value       = aws_acm_certificate.resume_acm.domain_name
}

output "cert_sans" {
  description = "Subject Alternative Names on the certificate"
  value       = aws_acm_certificate.resume_acm.subject_alternative_names
}