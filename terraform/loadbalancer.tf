resource "yandex_lb_network_load_balancer" "this" {
  name = "my-network-load-balancer"

  listener {
    name = "my-listener"
    port = var.lb-port
    external_address_spec {
      ip_version = "ipv4"
      # address = var.lb-ip
    }
  }

  labels = var.labels

  attached_target_group {
    target_group_id = "${yandex_compute_instance_group.this.load_balancer.0.target_group_id}"

    healthcheck {
      name = var.nlb_healthcheck.name
      http_options {
        port = var.nlb_healthcheck.port
        path = var.nlb_healthcheck.path
      }
    }
  }
}
