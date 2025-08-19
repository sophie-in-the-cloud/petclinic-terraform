output "bs_id" {
  value = aws_instance.tf-bs.id
}

output "instance_public_ip" {
  description = "The public IP address of the Bastion instance."
  value       = aws_instance.tf-bs.public_ip
}