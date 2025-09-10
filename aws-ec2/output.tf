output "aws_instance_Public_ip"{
    description = "Public IP of the AWS instance"
    value       = aws_instance.mydemoserver.public_ip
}