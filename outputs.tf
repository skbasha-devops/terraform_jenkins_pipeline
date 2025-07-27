output "files" {
  value = [
    local_file.file1.filename,
    local_file.file2.filename
  ]
}

output "directories" {
  value = [
    dirname(local_file.dir1_placeholder.filename),
    dirname(local_file.dir2_placeholder.filename)
  ]
}
