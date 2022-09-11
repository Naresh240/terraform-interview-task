# terraform-interview-task

Please, create a separate module for each of the resources below (VPC, EC2, S3, Route53)
1. Using Terraform, deploy to the ap-southeast-1 region:

   a. 1x VPC (192.168.50.0/16) with 4 subnets:

   	  i. 2x Public Subnets

   	  ii. 2x Private Subnets

   b. 1x EC2 Instance (t3.nano)

   	  i. Deploy the instance to one of the Private Subnets

   c. 1x S3 Bucket (choose a random name using the random Terraform Provider)

   	  i. The bucket must use encryption

   	  ii. The bucket's policy must allow only the account owner to perform all the "s3:*" operations

   	  iii. Anyone else should have limited permissions: s3:ListBucket, s3:GetObject  

   d. 1x Internal Route53 Zone geo-terraform-test.com

   e. 1x Route53 Record instance-test.geo-terraform-test.com pointing to the Instance's Private IP Address created in step 1.b.

1. The Terraform State file should be stored locally.

1. Please, provide the terraform plan output. Commit it to the repository.