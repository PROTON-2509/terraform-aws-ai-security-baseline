resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ai-security-vpc"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = "${var.region}${count.index == 0 ? "a" : "b"}"

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_vpc_endpoint" "bedrock" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.bedrock-runtime"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
}

resource "aws_security_group" "ai_egress_allowlist" {
  name        = "ai-egress-allowlist"
  description = "Restrict AI workload egress"
  vpc_id      = aws_vpc.main.id

  #  egress {
  #    from_port       = 443
  #    to_port         = 443
  #    protocol        = "tcp"
  #    prefix_list_ids = [aws_vpc_endpoint.bedrock.prefix_list_id]
  #    description     = "Bedrock runtime via private endpoint"
  #  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    description = "Internal services"
  }

  # No 0.0.0.0/0 egress. No public internet.
}