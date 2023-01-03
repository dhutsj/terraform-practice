resource "aws_subnet" "private" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = "192.168.1.0/24"
  availability_zone_id = "cnn1-az1"

  tags = {
    Name = "myvpc_private"
  }
}


resource "aws_subnet" "public" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = "192.168.2.0/24"
  availability_zone_id = "cnn1-az1"

  tags = {
    Name = "myvpc_public"
  }
}

resource "aws_subnet" "private2" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = "192.168.3.0/24"
  availability_zone_id = "cnn1-az2"

  tags = {
    Name = "myvpc_private2"
  }
}

resource "aws_subnet" "public2" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = "192.168.4.0/24"
  availability_zone_id = "cnn1-az2"

  tags = {
    Name = "myvpc_public2"
  }
}
