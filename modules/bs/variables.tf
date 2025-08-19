variable "bs_instance_type" {
  description = "The instance_type."
  default     = "t3.micro"
  type        = string
}

variable "vpc_id" {
  type = string
}
variable "sg_bs_id" {
  type = string
}
variable "pub_a_id" {
  type = string
}
variable "key_name" {
  type = string
}
