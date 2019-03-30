data "http" "example" {
  url = "https://api.github.com/repos/${var.repo}/releases/tags/${var.tag}"

  # Optional request headers
  request_headers {
    "Accept"        = "application/vnd.github.v3.raw"
    "Authorization" = "token ${var.token}"
  }
}

data "external" "asset_id" {
  program = ["python", "-c", "import sys, json; print json.dumps({'id': str(json.loads('${data.http.example.body}')[\"assets\"][0]['id'])})"]
}

data "external" "download" {
  program = ["python", "-c", "import requests, json; path = '${var.output_floader}/${var.file}'; url = 'https://${var.token}:@api.github.com/repos/${var.repo}/releases/assets/${data.external.asset_id.result.id}'; r = requests.get(url, headers={'Accept': 'application/octet-stream'}); open(path, 'wb').write(r.content); print json.dumps({'status' : str(r.status_code), 'path': path})"]
}

# repo = sys.argv[1]
# tag = sys.argv[2]
# token = sys.argv[3]
# object_name = sys.argv[4]
# output_floader = sys.argv[5]

# resource "null_resource" "web" {
#   triggers {
#     tag = "${var.tag}"
#   }

#   provisioner "local-exec" {
#     command = "python ${var.repo} ${var.tag} ${var.token} ${var.file} ${var.output_floader}"

#   }
# }



