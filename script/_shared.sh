SUPPORTED_OS_REGEX="^Ubuntu 14\.04"

#
# Who we are and where we are going in this ocean of chaos?
#
pushd $(dirname ${BASH_SOURCE[0]})/.. >/dev/null
  export WORK_PATH=$(pwd)
popd >/dev/null

export SCRIPT_PATH="${WORK_PATH}/script"
export ANSIBLE_PATH="${WORK_PATH}/ansible"

#
# Die with style and grace! ;)
#
function suicide() {
  echo ">>> FATAL: ${@}"
  exit 1
}

#
# Run on supported operating systems only
#
function supported_os() {
  grep "${SUPPORTED_OS_REGEX}" /etc/issue >/dev/null
}

supported_os || suicide "Your operating system is not supported!"
