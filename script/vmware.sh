#!/bin/bash -eux

case "$PACKER_BUILDER_TYPE" in
vmware-iso|vmware-vmx)
  SLES_VERSION="$(cat /etc/os-release | grep "^VERSION_ID=" | awk -F "=" '{print $2;}' | tr -d '"' | awk -F "." '{print $1;}')"
  if [[ "$SLES_VERSION" -eq "11" ]]; then
    echo "==> Installing esx nox tools"
    wget https://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub
    rpm --import VMWARE-PACKAGING-GPG-RSA-KEY.pub
    zypper --no-gpg-checks addservice --type=YUM https://packages.vmware.com/tools/esx/latest/sles11sp4/x86_64 vmware-tools-collection
    zypper --no-gpg-checks install -y -c vmware-tools-collection vmware-tools-esx-nox
  else
    echo "==> Installing open-vm-tools"
    zypper install -y open-vm-tools perl
  fi
  ;;
esac
