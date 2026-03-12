#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 group install -y "KDE Plasma Workspaces"


dnf5 install -y \
    firefox \
    konsole \
    dolphin \
    NetworkManager
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 clean all
#### Example for enabling a System Unit File

ln -s /usr/lib/systemd/system/sddm.service \
/etc/systemd/system/display-manager.service

systemctl enable NetworkManager.service

ln -sf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
