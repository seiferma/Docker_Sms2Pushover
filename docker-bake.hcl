variable "VERSION" {
  # renovate: datasource=repology depName=alpine_3_22/smstools
  default = "3.1.21-r4"
}

group "default" {
  targets = ["default"]
}

target "default" {
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["quay.io/seiferma/sms2pushover:${VERSION}", "quay.io/seiferma/sms2pushover:latest"]
  args = {
    VERSION = "${VERSION}"
  }
}