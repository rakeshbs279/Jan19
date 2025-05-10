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

1 Module for the work - Done 
- Create a Project Referencing the module and update the below
- Main.tf
- backend.tf
- Provider.tf

Next : Create S3 Bucket, Upload the logs to the S3 bucket - Done
Create file for the tfstate and backup - Pending


Service Model Comparison
Service Model	Examples	What You Manage	What the Provider Manages
IaaS (Infrastructure-as-a-Service)	EC2, S3	Virtual machines, storage, networking, OS	Hardware and virtualization
PaaS (Platform-as-a-Service)	RDS, Elastic Beanstalk	Application logic, database content	Infrastructure, OS, platform updates, and scaling
SaaS (Software-as-a-Service)	Gmail, Salesforce, Zoom	Only using the software's features	Everything, including the software and infrastructure

Created S3 Bucket , Enabled Versioning - Done
Versioning not working -- XX 
Created a RDS module using the module and the project 
RDS to Ec2 Connectivity - Done


Install Post gres, Start service 
Simple creation of table into the post gres
[ec2-user@ip-172-31-0-37 ~]$ sudo -i -u postgres
[postgres@ip-172-31-0-37 ~]$ psql
psql (15.9)
Type "help" for help.

postgres=# CREATE DATABASE testdb;
CREATE DATABASE
postgres=# \c testdb
You are now connected to database "testdb" as user "postgres".
testdb=# CREATE TABLE employees (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
role VARCHAR(50)
);
CREATE TABLE
testdb=# INSERT INTO employees (name, role) VALUES
('John Doe', 'Engineer'),
('Jane Smith', 'Manager'),
('Sam Brown', 'Technician');
INSERT 0 3
testdb=# SELECT * FROM employees;
id |    name    |    role    
----+------------+------------
1 | John Doe   | Engineer
2 | Jane Smith | Manager
3 | Sam Brown  | Technician
(3 rows)

testdb=# COMMIT;
WARNING:  there is no transaction in progress
COMMIT
testdb=# SELECT * FROM employees;
id |    name    |    role    
----+------------+------------
1 | John Doe   | Engineer
2 | Jane Smith | Manager
3 | Sam Brown  | Technician
(3 rows)

testdb=# 

[postgres@ip-172-31-0-37 ~]$ telnet terraform-20250106112241503100000001.c5aci44aip24.ap-south-1.rds.amazonaws.com 5432
Trying 172.31.24.102...
Connected to terraform-20250106112241503100000001.c5aci44aip24.ap-south-1.rds.amazonaws.com.
Escape character is '^]'.
^CConnection closed by foreign host.


Jan 7
Write a module for EFS(Gokul) & EBS(Rakesh)
Write RDS(rakesh) and EC2 module(Gokul)
plan, apply , destroy 
