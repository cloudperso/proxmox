#!/bin/bash

# Disable RAID for 2 last disk
mdadm --manage /dev/md2 --fail /dev/sdc2
mdadm --manage /dev/md2 --fail /dev/sdd2
mdadm --manage /dev/md2 --remove /dev/sdc2
mdadm --manage /dev/md2 --remove /dev/sdd2

# Disable ipv6
echo "# Désactivation ipv6" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf

# Vim configuration
cat << EOF > /root/.vimrc
set backspace=indent,eol,start  " Support du backspace
syntax on                       " Colorition syntaxique
set nocompatible                " Mode de compatibilité
set nu                          " Affiche la numérotation des lignes
set cursorline                  " Affiche une ligne sous le curseur
set incsearch                   " Déplace le curseur au fur et à mesure lors d'une recherche
set showcmd                     " Affiche la dernière commande
EOF

# Disable entreprise repos
sed -i 's/^/#/g' /etc/apt/sources.list.d/pve-enterprise.list

# Add SSH keys
cat << EOF > /root/.ssh/authorized_keys2
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDU1r9F3QIcBYJpTqtoaAAnwFaCsi3s8d8LZWzUDSyNHxbUXDL+5pEEjESv1kYDP5UW1OplfyYZfWsj3GcVjsMEI8OBCxili39rnNMBJKj5xjGTb/VipGbjhqr2ynPKKPAtS585y6CQdGT4WBvlc2H5sMoe07ySkk4kUsRQF5KdW0iN8IA8lOC3hDBTwQ2YBcfRo0gpyKtWvl/XvFGDwc4wB10HE25kNdjHE8d2BpuaXSETrdzjyFlos7qwgvdbA14v5xP4AJkpMy2ZlPvc4zzrICR4J4mo6Uze2FhkbT5WfZRy4HVFB1pj8HUXwbZ9L7dlHm6eNh0Rb4lIR4xTzt5ZZr2ueb89ciCMmpeN1U3VYUb1bW2pBPu6GgTKHEwUhwqguyiXLjbkkWdYq7aVTees14j7BGG9Ao1MQGt+k1LLDV2HmbxMDMgRALGoyBlfBHqndmzzZLsP584BPJ6mY4yhOCwPFG308xzahf2lwBp/LqQejd9pIrbHdRKC74xJ2dSatCFxCohqMr0mib5fIzkNp0yEiRoNXb5JY3Y0NhizhDQMmrXS9Ax/jj99OKpI5iUvk5ic1iY1488R+MdnNBNfdxQwvp5m8gf2oy2Nfj+XWV6sEFcCyw73iNMdoCXcizKHBvIow6L/us8oM91wOH921ogHZDc5Zqv7idZPvPQ== user@work-cloud 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+KzZ4BCA/eKHQIjCRZH2VsWc42pdpjRXtwya2Y5e7ElO6GptZgi06HW+o2h1WlR7xuB9Qw1IM9dZmBfE0BZnkwgRulPxJhALJBlkFlXiecceKZtotRTGT/1eRceIUnNwxb3507iNVGvXgdmO/WVitR/TwICj8L2palyGKuvgLjoAmpi3vYucldFmVFaTRNEuAe2GhZxjQUUpsa+OtyKS43GhAJyEgaR7ZhQHoiTMS1Ro/eDLRk5b+Qw2hxpmGI6wxTOQSvY85YPiW4774xArjNdqnDNfgg+V4SgV9uMTaHYrZCkpVyLJCnNYc5WO34u+5gM86NxQyZLuuarD1i6cTdUD0a96aqDgd+0bhOcvo8Lm6BOZfpb5UqOwWnaWGcHi7SxR2dEeiWepUk3bNlsCFxuyYrEIpcC8ZqhEe9pBNC9RrGLt63iGwEAlf0i9OVQNRv0N+SwopVVGv1Do50jWhRlOaV1ItnQdL2iyYQZ3f34W1DZCDhBFaAlabSOp/V8YVoSPPST7bc7bwXF7JbdUFdyMRciSwz3Tlzywy+lPQ+hdIRAncCNXna4Qw2xd+w70tvQx0u3eqCO9BuLaI4lfTe+L3mLXYLtufnvhcDUpbbaDSQKXg/DARZTSy1vAIXsvupuBfP37z0SBwjyf+soNdJT0sC32jOD9cCyGXllZA0Q== bruno@ThinkPad
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2f6n3wiB3tYJ79b5ijsbRRZWk9Qx0Zu39bv3qNUbSFnYxzrtXoFEnlebtEQ/oKFxecakdJ4sEFPUKTABzzTZjqfN19mWTH3sjzEgnSqJsVY3j3LYw4icmHCv6tDAQZatxJUhO5tYQYKa6gC0IrF6pgpQWlfI2YRw8P+pIxlQwQZg7NL9xWssRtqLV3VR5CKc827mFpZxhWlRLLiwMOsZIFlS5AwIrr49R5G53O8MxLG1mLbzIJ/DO9Qgbg1/3w90Wej8lr24tbwEGd0yjqHjkQ3cq4W6CVlpAf7LSoG9PpKlaQE67WRN9DWxItwbyEaCpgxozLfYnGqYhfmUl+iWT bruno@proxmox.localdomain
EOF

# Generate random password
echo "Random password for root user: $(openssl rand -base64 24)"
echo "Please copy-paste it 2 times to apply"
passwd root
