output certificate_domain_arn {
  value = aws_acm_certificate.certificate.arn
}

output validation_record_name_0 {
  value = aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name
}

output validation_record_type_0 {
  value = aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type
}

output validation_record_value_0 {
  value = aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value
}

output validation_record_name_1 {
  value = aws_acm_certificate.certificate.domain_validation_options.1.resource_record_name
}

output validation_record_type_1 {
  value = aws_acm_certificate.certificate.domain_validation_options.1.resource_record_type
}

output validation_record_value_1 {
  value = aws_acm_certificate.certificate.domain_validation_options.1.resource_record_value
}

//TODO limpiar manualmente todos los certificados/dominio guarros
//TODO probar un terraform de cero patatero a ver si va