#!/bin/bash

##################################
# Author: Zain Ahmad
# Date: 29/10/2026
# Version: v1
# This script reports AWS resource usage
##################################

# List S3 Buckets
echo "Print list of S3 buckets"
aws s3 ls > resourceTracker

# List Running EC2 Instances
echo "Print list of running EC2 instances"
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  | jq -r '.Reservations[].Instances[].InstanceId' >> resourceTracker

# List Lambda Functions
echo "Print list of Lambda functions"
aws lambda list-functions >> resourceTracker

# List IAM Users
echo "Print list of IAM users"
aws iam list-users >> resourceTracker
