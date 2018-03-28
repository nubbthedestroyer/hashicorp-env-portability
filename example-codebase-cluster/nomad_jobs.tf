provider "nomad" {
  # local
  address = "http://${var.nomad_ip}:4646"
}

locals {
  this_count = 3
}

variable "version" {
  default = "latest"
}

data "template_file" "job-1" {
  template = "${file("${path.root}/http-echo-1.hcl")}"

  vars {
    version    = "${var.version}"
    this_count = "${local.this_count}"
  }
}

resource "nomad_job" "http-echo-1" {
  jobspec = "${data.template_file.job-1.rendered}"
}

data "template_file" "job-2" {
  template = "${file("${path.root}/http-echo-2.hcl")}"

  vars {
    version    = "${var.version}"
    this_count = "${local.this_count}"
  }
}

resource "nomad_job" "http-echo-2" {
  jobspec = "${data.template_file.job-2.rendered}"
}
