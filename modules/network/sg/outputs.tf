
output "sg_alb_id" {
  value = aws_security_group.sg_alb.id
}

output "sg_web_id" {
  value = aws_security_group.sg_web.id
}

output "sg_was_id" {
  value = aws_security_group.sg_was.id
}

output "sg_db_id" {
  value = aws_security_group.sg_db.id
}

output "sg_nlb_id" {
  value = aws_security_group.sg_nlb.id
}

output "sg_bs_id" {
  value = aws_security_group.sg_bs.id
}