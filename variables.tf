variable "aws_region" {
  description = "איזור ענן AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "סוג אינסטנס"
  type        = string
  default     = "t2.micro"
}

