data "yandex_compute_image" "this" {
  name = "${var.image_name}-${var.image_tag}"
}

resource "yandex_compute_instance_group" "this" {
  name               = "my-instance-group-with-balancer"
  folder_id          =  var.YC_FOLDER_ID
  service_account_id = "${yandex_iam_service_account.this.id}"
  depends_on          = [yandex_resourcemanager_folder_iam_binding.this]
  
  labels = var.labels

  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = var.resources.memory
      cores  = var.resources.cores
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = data.yandex_compute_image.this.id
      }
    }

    network_interface {
      network_id = "${yandex_vpc_network.this.id}"
      subnet_ids = [for k, v in yandex_vpc_subnet.this : yandex_vpc_subnet.this[k].id]       
    }

    metadata = {
      ssh-keys = "yc-user:${file("~/.ssh/id_rsa.pub")}"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.vm_count
    }
  }

  allocation_policy {
    zones = var.zones
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "compute-instance-target-group"
    target_group_description = "Compute instance load balancer target group"
  }
}
