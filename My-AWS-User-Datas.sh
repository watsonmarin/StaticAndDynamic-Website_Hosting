#Install AWS CLI and SSM Agent
#Install AWS CLI and SSM Agent
#!/bin/bash
sudo -i
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
yum install unzip -y
unzip awscli-bundle.zip
./awscli-bundle/install -b ~/bin/aws
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent


#How to create mount EFS on your EC2 Instances
#You can as well pass it as a UserData
#!/bin/bash
sudo yum -y update
sudo yum install -y amazon-efs-utils
sudo mkdir /mnt/efs
cd /mnt
sudo mount -t efs fs-24f7eea7:/ efs
#Where you have "fs-87d3ca04" replace it with your EFS ID



#Custom IAM Policy
#Create a custom IAM policy
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::632667633814:role/MyCA-Role"
  }
}


#Create a Launch LaunchConfiguration Using AWS CLI
aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config \
  --image-id ami-09d8b5222f2b93bf0 --instance-type t2.micro --associate-public-ip-address \
  --security-groups sg-a9f6298b --key-name My-Key-pem

create-key-pair --key-name My-Key-pem


#My Route53 Oregon Web Server
#!/bin/bash
yum update -y
yum install httpd -y
chkconfig httpd on
service httpd start
cd /var/www/html
echo "<html><h1>Hello JJTECHInc Friends! This is my Oregon Web Server. We are doing a group demo. We have Jeannel, MaRose, Elvis, Ma Adela, Policap, Yvone, Deco, Mbandi, Rajif</h1></html>" > index.html


#My Route53 North Virginia Web Server
#!/bin/bash
yum update -y
yum install httpd -y
chkconfig httpd on
service httpd start
cd /var/www/html
echo "<html><h1>Hello JJTECHInc Friends! This is my North Virginia Web Server. We are doing a group demo. We have Jeannel, MaRose, Elvis, Ma Adela, Policap, Yvone, Deco, Mbandi, Rajif</h1></html>" > index.html


#Event SourceCodeFor CloudWatch Log/LogStream
#Sample codes for specifying a custom CloudWatch Event
{
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "logs.amazonaws.com",
    ],
    "eventName": [
      "CreateLogStream",
    ]
  }
}


#Migration Hub In AWS
#The Command To Install The AWS ADS Migration Agent in the servers you're migrating to AWS. Can be Onprem/Cloud
#!/bin/bash
sudo curl -o ./aws-discovery-agent.tar.gz https://s3-us-west-2.amazonaws.com/aws-discovery-agent.us-west-2/linux/latest/aws-discovery-agent.tar.gz

sudo tar -xzf aws-discovery-agent.tar.gz

sudo bash install -r us-west-2 -k AKIAQRFMEUVUZJODTLWW -s 5UJCY6J1j7X3jNyU5N373hEcXSacjFxunP3fwFcd
