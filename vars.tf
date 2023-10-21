variable  "SERVERNAME" {
  default = "mydemo"
}

variable  "CREATOR" {
  default = "Toai Vo"
}

variable  "REGION" {
  default = "us-west-2"
}

variable "VPCID" {
   default = "vpc-57fcea33"
   }

variable "ASG_NAME" {
   default = "mydemo"
  }

variable "LC_NAME" {
   default = "mydemo"
  }

# us-west-2a
variable "SUBNET1" {
   default = "subnet-63695007xc"
  }
# us-west-2b
variable "SUBNET2" {
   default = "subnet-251c4c53kt"
  }
#  us-west-2d
variable "SUBNET3" {
   default = "subnet-31752a19mt"
  }

variable "MIN_SIZE" {
   default = "1"
  }

variable "MAX_SIZE" {
   default = "1"
  }

variable "ASG_DESIRE" {
   default = "1"
  }

variable "HEALTH_CHECK_GRACE_PERIOD" {
   default = "300"
  }

#  default OEL 8.7 = "ami-07ec38a03db614220"
variable "IMAGE_ID" {
   default = "ami-07ec38a03db614220"
  }

variable "INSTANCE_TYPE" {
   default = "t2.micro"
  }

variable "KEY_NAME" {
   default = "toai-keypair"
  }

#  Security ToaiWebServer
# inbound world 80, 443
variable "SG" {
   default = "sg-03e91a5152feae317"
  }

variable "VOLUME_TYPE" {
   default = "gp2"
  }

variable "VOLUME_SIZE" {
   default = "24"
  }

variable "IAMROLE" {
   default = "Toai-S3EC2Role"
  }

variable "DELETE_ON_TERMINATION" {
   default = "true"
  }
