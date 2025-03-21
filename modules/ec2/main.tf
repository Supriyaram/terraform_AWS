# Create the Key Pair
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

#Create security group
resource "aws_security_group" "this" {
  ingress {                             # Allow SSH from anywhere
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]         # Open to all (Use with caution)
  }
  ingress {
    from_port   = 80                    # Allow HTTP from anywhere
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "ec2_security_group"
  }
}


# Create EC2 Instance
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.this.id]  #Attach security group to ec2, if not specifed default sg will be attached
  tags = {
    "Name" = "terraform_ec2"
  }

  # Configure Root Volume
  root_block_device {
    volume_size           = 8          # 8 GB volume
    volume_type           = "gp2"      # General Purpose SSD
    delete_on_termination = true       # Delete volume on instance termination
  }

  # Add User Data (Script for bootstrapping)
  user_data = file("${path.module}/user_data.sh") # Path to script

  # Attach the IAM Role
  iam_instance_profile = var.instance_profile
}