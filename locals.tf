locals {
  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }

  server_name = "${coalesce(var.custom_server_name, "${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-mariadbserver")}"
}
