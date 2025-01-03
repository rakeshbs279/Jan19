This Project is for the Terraform GR 
Project Name : GR
Date : Dec 23
Modules : EC2_module
Description : Build a New EC2 using the module EC2_Module
Git Repo : https://github.com/rakeshbs279/Jan19/tree/Project1 
Future Enhancement


Commands for Git Repo : Branch Project1

PS C:\Users\veerg\Documents\workspace\GR> history

  Id CommandLine                                                                                                                                                                   
  -- -----------
   1 git init
   2 git add .
   3 git status
   5 git commit -m " add dir GR"
   6 git remote add origin https://github.com/rakeshbs279/Jan19.git
   7 git remote -v
   8 git branch
   9 git checkout -b Project1
  22 git pull origin Project1 --allow-unrelated-histories
  23 git push origin Project1

Dec 24 : Rakesh

Dec 25 : 
Volume Snapshot creation for the Existing  Volume - Done 

create cloudwatch to monitor CPU Performance for the exiting EC2


Code for the S3 Actions - Prakash 

{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Deny",
"Principal": "*",
"Action": "s3:*
",
"Resource": [
"arn:aws:s3:::terraform-statefile-prakash",
"arn:aws:s3:::terraform-statefile-prakash/*"
],
"Condition": {
"StringNotEquals": {
"aws:PrincipalArn": [
"arn:aws:iam::124355674626:user/Terraform",
"arn:aws:iam::124355674626:root"
]
}
}
}
]
}

Notes : 

Terraform Day1 : using the main module - > Update Bucket Policy , Change the KMS , Create Bucket

1 Module for the work
- Create a Project referering the module and update the below
- Main.tf
- backend.tf
- Provider.tf

Next : Create S3 Bucket, Upload the logs to the S3 bucket
Create file for the tfstate and backup 


Service Model Comparison
Service Model	Examples	What You Manage	What the Provider Manages
IaaS (Infrastructure-as-a-Service)	EC2, S3	Virtual machines, storage, networking, OS	Hardware and virtualization
PaaS (Platform-as-a-Service)	RDS, Elastic Beanstalk	Application logic, database content	Infrastructure, OS, platform updates, and scaling
SaaS (Software-as-a-Service)	Gmail, Salesforce, Zoom	Only using the software's features	Everything, including the software and infrastructure