output "private_subnet1_id" {
  value = aws_subnet.private.id
}

output "private_subnet2_id" {
  value = aws_subnet.private2.id
}

output "public_subnet1_id" {
  value = aws_subnet.public.id
}

output "public_subnet2_id" {
  value = aws_subnet.public2.id
}

output "vpc_id" {
    value = aws_vpc.main.id
}
