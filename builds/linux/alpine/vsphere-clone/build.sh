#! /usr/bin/env bash

REPO_ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd) 
export PACKER_PLUGIN_PATH=$REPO_ROOT_PATH/plugins

$REPO_ROOT_PATH/packer build \
-var-file="$REPO_ROOT_PATH/variables/common.pkrvars.hcl" \
-var-file="$REPO_ROOT_PATH/variables/vsphere.pkrvars.hcl" \
$REPO_ROOT_PATH/builds/linux/alpine/vsphere-clone