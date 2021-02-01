output "instance_id" {
  value = aws_instance.example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}

