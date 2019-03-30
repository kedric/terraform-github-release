output "file_path" {
  value = "${var.output_floader}/${var.file}"
}

output "md5" {
  value = "${filemd5("${var.output_floader}/${var.file}")}"
}
