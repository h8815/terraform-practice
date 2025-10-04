output "aws_ami" {
    value = data.aws_ami.name.id
}   

output "caller_id" {
  value = data.aws_caller_identity.name
}