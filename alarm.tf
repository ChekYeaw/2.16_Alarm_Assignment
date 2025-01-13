resource "aws_cloudwatch_metric_alarm" "info-count" {
  alarm_name                = "chek-info-count-breach"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "info-count"
  namespace                 = "/moviedb-api/chek"
  period                    = 60
  statistic                 = "Sum"
  threshold                 = 10
  alarm_actions             = [aws_sns_topic.info-count.arn]
 
}

resource "aws_sns_topic" "info-count" {
  name = "chek-info-count-topic"
}

resource "aws_sqs_queue" "info-count" {
  name = "chek-info-count-queue"
}

resource "aws_sns_topic_subscription" "info-count" {
  topic_arn = aws_sns_topic.info-count.arn
  protocol  = "email"
  endpoint  = "chekyeaw@gmail.com"
}