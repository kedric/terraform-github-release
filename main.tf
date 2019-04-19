data "http" "example" {
  url = "https://api.github.com/repos/${var.repo}/releases/tags/${var.tag}"

  # Optional request headers
  request_headers {
    "Accept"        = "application/vnd.github.v3.raw"
    "Authorization" = "token ${var.token}"
  }
}

data "external" "asset_id" {
  program = ["python", "-c", "import sys, json; print json.dumps({'id': str(filter(lambda x: x['name'] == '${var.file}',json.loads('${data.http.example.body}')['assets'])[0]['id'])})"]
}

data "external" "download" {
  program = ["python", "-c", "import requests, json; path = '${var.output_floader}/${var.outfile}'; url = 'https://${var.token}:@api.github.com/repos/${var.repo}/releases/assets/${data.external.asset_id.result.id}'; r = requests.get(url, headers={'Accept': 'application/octet-stream'}); open(path, 'wb').write(r.content); print json.dumps({'status' : str(r.status_code), 'path': path})"]
}




