key_name        = "ec2-keypair"
public_key_path = "~/.ssh/id_rsa.pub"
ami_id          = "ami-08b5b3a93ed654d19" 
instance_type   = "t2.micro"
instance_profile = "ec2-instance-profile"   //name of the aws_iam_instance_profile
availability_zone = "us-east-1d"
ebs_volume_size = 2
object_key = "backup/user_data.txt"
vpc_cidr = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/24"

files_to_upload = {
  "index.html" = "../../global/index.html"
  "error.html" = "../../global/error.html"
  "google.png" = "../../global/google-img.png"
}

