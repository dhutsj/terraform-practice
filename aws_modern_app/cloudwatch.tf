/* resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale_in"
  autoscaling_group_name = aws_autoscaling_group.bar.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 120
}

resource "aws_cloudwatch_metric_alarm" "scale_in" {
  alarm_description   = "Monitors CPU utilization for ASG"
  alarm_actions       = [aws_autoscaling_policy.scale_in.arn]
  alarm_name          = "terramino_scale_in"
  comparison_operator = "LessThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = "10"
  evaluation_periods  = "2"
  period              = "120"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.bar.name
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale_out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.bar.name
}

resource "aws_cloudwatch_metric_alarm" "scale_out" {
  alarm_name          = "terramino_scale_out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.bar.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_out.arn]
}
*/
resource "aws_autoscaling_policy" "active_connection_scale_out" {
  name                   = "active_connection_scale_out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.bar.name
}

resource "aws_cloudwatch_metric_alarm" "active_connetcion_scale_out" {
  alarm_name          = "terramino_active_connection_scale_out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "ActiveConnectionCount"
  namespace           = "AWS/ApplicationELB"
  period              = "120"
  statistic           = "Sum"
  threshold           = "1000"

  dimensions = {
    LoadBalancer = aws_lb.alb.arn_suffix
  }

  alarm_description = "This metric monitors ALB Active Connection Count"
  alarm_actions     = [aws_autoscaling_policy.active_connection_scale_out.arn]
}

resource "aws_autoscaling_policy" "active_connection_scale_in" {
  name                   = "active_connection_scale_in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.bar.name
}

resource "aws_cloudwatch_metric_alarm" "active_connetcion_scale_in" {
  alarm_name          = "terramino_active_connection_scale_in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "ActiveConnectionCount"
  namespace           = "AWS/ApplicationELB"
  period              = "120"
  statistic           = "Sum"
  threshold           = "100"

  dimensions = {
    LoadBalancer = aws_lb.alb.arn_suffix
  }

  alarm_description = "This metric monitors ALB Active Connection Count"
  alarm_actions     = [aws_autoscaling_policy.active_connection_scale_in.arn]
}
