resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("./keys/mykey.pub")
}


data "template_file" "userdata" {
  template = file("${path.module}/user_data.tftpl")

  vars = {
    endpoint = var.nlb_dns_name
  }
}
resource "aws_launch_template" "apache-launch" {
  name                   = "apache-launch"
  image_id               = data.aws_ami.apache.id
  instance_type          = var.apache_instance_type
  vpc_security_group_ids = [var.sg_web_id]
  key_name               = aws_key_pair.mykey.key_name
  update_default_version = true
  user_data              = base64encode(data.template_file.userdata.rendered)
}

resource "aws_launch_template" "tomcat-launch" {
  name                   = "tf-launch"
  image_id               = data.aws_ami.tomcat.id
  instance_type          = var.tomcat_instance_type
  vpc_security_group_ids = [var.sg_was_id]
  key_name               = aws_key_pair.mykey.key_name
  update_default_version = true
}


resource "aws_autoscaling_group" "apache_web_asg" {
  name_prefix = "tf-web_asg"
  launch_template {
    id      = aws_launch_template.apache-launch.id
    version = "$Latest"
  }
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  health_check_grace_period = 1
  default_cooldown          = 0
  # health_check_type         = "ELB"
  vpc_zone_identifier = [var.pri01_a_sub_id, var.pri01_c_sub_id]
  target_group_arns   = [var.alb_target_group_arn]
  tag {
    key                 = "Name"
    value               = "njt-web-asg"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "tf_was_asg" {
  name_prefix = "tf-was_asg"
  launch_template {
    id      = aws_launch_template.tomcat-launch.id
    version = "$Latest"
  }
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  health_check_grace_period = 1
  default_cooldown          = 0
  # health_check_type         = "ELB"
  vpc_zone_identifier = [var.pri02_a_sub_id, var.pri02_c_sub_id]
  target_group_arns   = [var.nlb_target_group_arn]
  tag {
    key                 = "Name"
    value               = "njt-was-asg"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}
