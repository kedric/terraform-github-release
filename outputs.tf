output "file_path" {
  value = "${var.output_floader}/${var.outfile}"
}

output "hash" {
  value = "${base64sha256(file("${var.output_floader}/${var.file}"))}"
}
