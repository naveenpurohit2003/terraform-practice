resource "aws_s3_bucket" "naveen_terraform" {
  bucket = "naveen-tf-02"
  tags = {
    "Description" = "Bucket for saving tfstate files"
  }
}

resource "aws_s3_bucket_policy" "naveenbucketpolicy" {
  bucket = "naveen-tf-02"
  policy = <<EOF

{
  "Id": "Policy1657734385726",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1657734383892",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::naveen-tf-02",
      "Principal": {
        "AWS": [
          "arn:aws:iam::106619687188:user/naveen"
        ]
      }
    }
  ]
}

  
EOF
}

resource "aws_dynamodb_table" "state_locking" {
   
  name = "state_locking"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
  
