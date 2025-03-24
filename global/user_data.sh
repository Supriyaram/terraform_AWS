#!/bin/bash
#!/bin/bash#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to Your EC2 Instance!</h1>" > /var/www/html/index.html
