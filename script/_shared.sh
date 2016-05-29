#
# Who we are and where we are going in this ocean of chaos?
#
pushd $(dirname ${BASH_SOURCE[0]})/.. >/dev/null
  export WORK_PATH=$(pwd)
popd >/dev/null

export SCRIPT_PATH="${WORK_PATH}/script"
export ANSIBLE_PATH="${WORK_PATH}/ansible"
export ANSIBLE_INVENTORY_PATH="${ANSIBLE_PATH}/inventory"
export ANSIBLE_ROLE_PATH="${ANSIBLE_PATH}/roles"

#
# Die with style and grace! ;)
#
function suicide() {
  echo ">>> FATAL: ${@}"
  exit 1
}
