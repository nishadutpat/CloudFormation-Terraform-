
resource "aws_cloudformation_stack" "basic_stack" {
  name = "BasicIAM-S3-Stack"

  template_body = jsonencode({
    Resources = {
      MyS3Bucket = {
        Type = "AWS::S3::Bucket"
        Properties = {
          BucketName = "basic-cloudformation-bucket"
        }
      }

      MyIAMRole = {
        Type = "AWS::IAM::Role"
        Properties = {
          RoleName = "BasicIAMRole"
          AssumeRolePolicyDocument = {
            Version = "2012-10-17"
            Statement = [
              {
                Effect = "Allow"
                Principal = { Service = "lambda.amazonaws.com" }
                Action = "sts:AssumeRole"
              }
            ]
          }
        }
      }
    }
  })

  capabilities = ["CAPABILITY_NAMED_IAM"]
}
