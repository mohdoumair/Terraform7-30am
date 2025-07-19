# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach basic execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# S3 Bucket Data Source
data "aws_s3_bucket" "lambda_bucket" {
  bucket = "ghxdfhxdrtghdxcfgfc"
  
}

# S3 Object Data Source
data "aws_s3_object" "lambda_code" {
  bucket = data.aws_s3_bucket.lambda_bucket.bucket  # Correct reference
  key    = "lambda_function.zip"
}

# Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_exec.arn  # Removed quotes
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  source_code_hash ="python base64sha256(data.aws_s3_object.lambda_code.body)"
  s3_bucket        = data.aws_s3_bucket.lambda_bucket.bucket  # Correct reference
  s3_key           = data.aws_s3_object.lambda_code.key
  
  
}