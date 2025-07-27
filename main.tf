provider "local" {}

resource "local_file" "dir1_placeholder" {
  filename = "${path.module}/dir1/.placeholder"
  content  = "Directory 1 created"
}

resource "local_file" "dir2_placeholder" {
  filename = "${path.module}/dir2/.placeholder"
  content  = "Directory 2 created"
}

resource "local_file" "file1" {
  filename = "${path.module}/file1.txt"
  content  = "This is file 1"
}

resource "local_file" "file2" {
  filename = "${path.module}/file2.txt"
  content  = "This is file 2"
}
