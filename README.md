# UoM_MapReduce-vs-Spark
> CS5229 - Big Data Analytics Technologies

# How to Set Up Amazon EMR
> This guide will walk you through the steps of setting up Amazon EMR. Amazon EMR is a web service that provides a managed cluster platform for processing large amounts of data. This guide assumes that you have an Learner Lab AWS account and basic familiarity with the AWS Management Console.

## Prerequisites
1. An AWS account
2. Basic familiarity with the AWS Management Console
3. Basic knowledge of terminal commands

## Step-a-cluster
1. Go to AWS Learner Lab.
2. Click "Start Lab".
3. Click "AWS".
4. Choose "EMR".
5. Click "Create cluster".
6. Select "m4.large".
7. Untick "Auto Termination".
8. For EC2 key pair, choose the "vockey" key pair and download "labsuser.pem".
9. Click "Create cluster".

### Cluster Setup
![Cluster Setup](./Resources/Images/cluster-setup.png)

10. Go to the cluster's Summary >> Security and access >> Security groups for Master.
    - Select the security group for the master node.
    - In the bottom pane, choose the Inbound rules tab, and then choose Edit inbound rules.
    - At the bottom of the page, choose Add rule, and then configure SSH.
    - Type: Choose "SSH".
    - Source: Choose "Anywhere-IPv4".
    - Choose "Save rules".

## connect-to-emr
1. Go to Terminal.
2. cd Downloads.
3. chmod 400 labsuser.pem.
4. ssh -i /Users/dilanka/Downloads/labsuser.pem hadoop@ec2-44-200-14-97.compute-1.amazonaws.com.

### EMR Terminal View
![EMR Terminal View](./Resources/Images/emr-terminal-view.png)

## setup-s3-bucket
1. Go to Amazon S3.
2. Create a Bucket.
3. Update the permission to access public by adding the following policy to your bucket policy:

> {
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": "",
"Action": "s3:GetObject",
"Resource": "arn:aws:s3:::bucket-test-dilanka-003/",
"Condition": {}
}
]
}


### S3 Bucket Permission Update
![S3 Bucket Permission Update](./Resources/Images/s3-bucket-permission-update.png)

4. Create a folder.
5. Upload the dataset to the folder.

### S3 Bucket Setup
![S3 Bucket Permission Update](./Resources/Images/s3-bucket.png)

### Dataset
[Download Dataset file](./Resources/Dataset/DelayedFlights-updated.csv)

### Results
[Download Results file](./Resources/Results.xlsx)

### Comparison of Hadoop Vs Spark for Carrier Delay
![Comparison of Hadoop Vs Spark for Carrier Delay](./Resources/plot1.png)

### Comparison of Hadoop Vs Spark for NAS Delay
![Comparison of Hadoop Vs Spark for NAS Delay](./Resources/plot2.png)

### Comparison of Hadoop Vs Spark for Weather Delay
![Comparison of Hadoop Vs Spark for Weather Delay](./Resources/plot3.png)

### Comparison of Hadoop Vs Spark for Late Aircraft Delay
![Comparison of Hadoop Vs Spark for Late Aircraft Delay](./Resources/plot4.png)

### Comparison of Hadoop Vs Spark for Security Delay
![Comparison of Hadoop Vs Spark for Security Delay](./Resources/plot5.png)

### Comparison of Average Time Taken by MapReduce (HiveQL) Vs Spark (Spark-SQL) for Each Query
![Comparison of Average Time Taken by MapReduce (HiveQL) Vs Spark (Spark-SQL) for Each Query](./Resources/plot6.png)
