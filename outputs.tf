output "file_path" {
  value = "${var.output_floader}/${var.outfile}"
}

output "hash" {
  value = "${base64sha256(file("${data.external.download.result.path}"))}"
  #   depends_on = ["data.external.download"]
}
