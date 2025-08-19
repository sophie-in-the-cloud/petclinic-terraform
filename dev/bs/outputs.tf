output "bs_instance_public_ip" {
  description = "Bastion Public IP address."
  value       =  module.bs.instance_public_ip
}