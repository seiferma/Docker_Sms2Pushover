variable "VERSION" {
  default = "0.1.0"
}

group "default" {
  targets = ["default"]
}

target "default" {
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["quay.io/seiferma/sms2pushover:${VERSION}", "quay.io/seiferma/sms2pushover:latest"]
}