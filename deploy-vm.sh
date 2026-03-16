#!/bin/bash

RESOURCE_GROUP="demo-resource-group"
LOCATION="eastus"
VM_NAME="demoVM"

echo "Creating Resource Group..."

az group create \
--name $RESOURCE_GROUP \
--location $LOCATION

echo "Creating Virtual Machine..."

az vm create \
--resource-group $RESOURCE_GROUP \
--name $VM_NAME \
--image UbuntuLTS \
--admin-username azureuser \
--generate-ssh-keys

echo "Opening port 22 for SSH..."

az vm open-port \
--port 22 \
--resource-group $RESOURCE_GROUP \
--name $VM_NAME

echo "Deployment Completed!"
