# SLURM Terraform practice

With this project you can build a custom Centos image with Packer, upload it to Yandex cloud, and deploy an infrastructure based on this image.

Cd to ```packer``` dir.

First export environment variables with Yandex credentials for Packer.
For this you need the YC utility installed and set up.
You also got to have a default subnet ```default-ru-central1-a``` for the build process to be successful. Alternatively you may specify any existing subnet name in ```pkr_env_vars.sh``` file.

```
source ./pkr_env_vars.sh
```

Build an image with Packer and upload it to Yandex cloud. You may specify any numeric tag:

```
packer build -var "image_tag=1" .
```

Now ```cd``` to ```terraform``` dir.

Export environment variables with Yandex credentials for Terraform. You need the YC utility installed and set up:

```
source ./tf_env_vars.sh
```

You may want to correct variables in ```var.auto.tfvars``` file to your liking.

Set up Terraform:

```
terraform init
```

Run Terraform:

```
terraform apply -auto-approve
```

You may specify image name, image tag and amount of VMs like this:

```
terraform apply -auto-approve \
                -var="image_name=my-name" \
                -var="image_tag=my-tag" \
                -var="vm_count=4"
```
