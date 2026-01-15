locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${local.name_prefix}-asg-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when ASG average CPU > 70%"

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }
}

