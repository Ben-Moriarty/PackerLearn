REPO_ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)
export PACKER_PLUGIN_PATH=$REPO_ROOT_PATH/plugins

$REPO_ROOT_PATH/packer build -var-file="$REPO_ROOT_PATH/variables/vsphere.pkrvars.hcl" $(dirname ${BASH_SOURCE[0]})