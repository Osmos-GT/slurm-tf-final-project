output "load_balancer_public_ip" {
    description = "Show LB public IP"
    value = tolist(tolist(yandex_lb_network_load_balancer.this.listener).0.external_address_spec).0.address
}
