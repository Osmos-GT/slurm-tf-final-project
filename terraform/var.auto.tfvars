##  compute instances vars ##

resources = {
    cores = 2
    memory = 2
}

##  network-related vars ##

cidr_blocks = [
  ["10.10.0.0/24"],
  ["10.11.0.0/24"],
  ["10.12.0.0/24"],
]

lb-port = 80

# lb-ip = "51.250.111.119"

nlb_healthcheck = {
    name   = "test"
    port   = 80
    path   = "/"
}

## other vars ##

labels = {
    "slurm" = "rules"
    "practice" = "terraform"
}
