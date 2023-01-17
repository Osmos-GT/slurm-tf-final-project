##  compute instances vars ##

variable "image_name" {
  type    = string
  default = "nginx"
}

variable "image_tag" {
  type    = string
  default = "1"
}

variable "vm_count" {
  type = number
  default = 3
}

variable "resources" {
    type = object({
      cores  = number
      memory = number
    })
    description = "VM resources variable"
}

##  network-related vars ##

variable "zones" {
  type = list(string)
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c"
  ]
}

variable "cidr_blocks" {
  type        = list(list(string))
  description = "List of lists of IPv4 cidr blocks for subnets"
}

variable "lb-port" {
  type    = number
}

# variable "lb-ip" {
#   type    = string
#   description = "You may specify LB static IP here"
# }

variable "nlb_healthcheck" {
    type = object({
      name = string
      port = number
      path = string
    })
    description = "a complex variable example"
}

## other vars ##

variable "labels" {
    type        = map(string)
    description = "a dictionary with labels"
}

## yandex credentials ##

variable "YC_TOKEN" {
  type = string
}

variable "YC_CLOUD_ID" {
  type = string
}

variable "YC_FOLDER_ID" {
  type = string
}
