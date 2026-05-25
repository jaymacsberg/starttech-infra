locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_cloudwatch_log_group" "backend" {
  name              = "/${var.project_name}/${var.environment}/backend"
  retention_in_days = 7

  tags = {
    Name        = "${local.name_prefix}-backend-log-group"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${local.name_prefix}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "text"
        x      = 0
        y      = 0
        width  = 24
        height = 3

        properties = {
          markdown = "# StartTech Monitoring Dashboard\nBackend logs, EC2, ALB, and application health should be monitored here."
        }
      },
      {
        type   = "log"
        x      = 0
        y      = 3
        width  = 24
        height = 6

        properties = {
          query  = "SOURCE '${aws_cloudwatch_log_group.backend.name}' | fields @timestamp, @message | sort @timestamp desc | limit 20"
          region = data.aws_region.current.id
          title  = "Recent Backend Logs"
          view   = "table"
        }
      }
    ]
  })
}

data "aws_region" "current" {}
