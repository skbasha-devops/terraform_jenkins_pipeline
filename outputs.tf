output "files" {
value = [
local_file.file1.filename,
local_file.file2.filename
}
}

output "directories" {
value = [
  local_file.file1.filename,
  local_file.file2.filename
}  # This should be ]
}
