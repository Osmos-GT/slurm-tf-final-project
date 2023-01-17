## Specify your subnet name here
SUBNET_NAME=default-ru-central1-a

## Export variables
export PKR_VAR_YC_TOKEN=$(yc iam create-token)
export PKR_VAR_SUBNET_ID=$(yc vpc subnet get $SUBNET_NAME | awk '{print $2}' | head -1)
export PKR_VAR_YC_FOLDER_ID=$(yc config get folder-id)
