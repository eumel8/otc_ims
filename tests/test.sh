#!/bin/sh

# Prerequisites:
# Cloud API Credentials
# image disk on OBS ansible011:bionic-server-cloudimg-amd64.vmdk
echo "SCENARIO 1: create image"
ansible-playbook test.yml -e "image_name=ansible-image01 image_url=ansible011:bionic-server-cloudimg-amd64.vmdk image_min_disk=12 localaction=create waitfor=true" || exit 1
echo "SCENARIO 2: show image"
ansible-playbook test.yml -e "image_name=ansible-image01 localaction=show" || exit 1
echo "SCENARIO 3: list images (pagination)"
ansible-playbook test.yml -e "localaction=list" || exit 1
echo "SCENARIO 4: delete image"
ansible-playbook test.yml -e "image_name=ansible-image01 localaction=delete" || exit 1
