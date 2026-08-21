module "security_group" {
  source = "../../source/terraform-aws-sg"

  security_group = {
    name        = "example-security-group"
    description = "Example Security Group created using the Terraform AWS Security Group module"
    vpc_id      = "vpc-0123456789abcdef0"

    revoke_rules_on_delete = false

    tags = {
      appid       = "APP-1234"
      environment = "dev"
      managed_by  = "terraform"
    }

    vpc_associations = []

    ingress = {
      https = {
        description                  = "HTTPS"
        ip_protocol                  = "tcp"
        from_port                    = 443
        to_port                      = 443
        cidr_ipv4                    = "0.0.0.0/0"
        cidr_ipv6                    = null
        prefix_list_id               = null
        referenced_security_group_id = null

        tags = {
          appid = "APP-1234"
        }
      }

      ssh = {
        description                  = "SSH"
        ip_protocol                  = "tcp"
        from_port                    = 22
        to_port                      = 22
        cidr_ipv4                    = "10.0.0.0/8"
        cidr_ipv6                    = null
        prefix_list_id               = null
        referenced_security_group_id = null

        tags = {
          appid = "APP-1234"
        }
      }
    }

    egress = {
      https = {
        description                  = "HTTPS outbound"
        ip_protocol                  = "tcp"
        from_port                    = 443
        to_port                      = 443
        cidr_ipv4                    = "0.0.0.0/0"
        cidr_ipv6                    = null
        prefix_list_id               = null
        referenced_security_group_id = null

        tags = {
          appid = "APP-1234"
        }
      }
    }
  }
}