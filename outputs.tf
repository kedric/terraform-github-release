output "file_path" {
  value = "${data.external.download.result.path}"
}

output "md5" {
  value = "${filemd5(data.external.download.result.path)}"
}
