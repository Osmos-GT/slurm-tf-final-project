source "yandex" "yandex-custom" {
  folder_id           = var.YC_FOLDER_ID
  token               = var.YC_TOKEN
  source_image_family = "centos-7"
  ssh_username        = "centos"
  use_ipv4_nat        = "true"
  
  image_description   = "Yandex Cloud Centos custom image"
  image_family        = "my-images"
  image_name          = "nginx-${var.image_tag}"
  subnet_id           = var.SUBNET_ID
  disk_type           = "network-hdd"
  zone                = "ru-central1-a"
}

build {
    sources = ["source.yandex.yandex-custom"]

    provisioner "ansible" {
        playbook_file = "./ansible/playbook.yml"
        use_proxy = false
    }

}