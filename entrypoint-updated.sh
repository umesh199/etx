#!/bin/bash

echo "==> Mounting NFS share..."
mkdir -p /user
mount -t nfs 172.16.132.231:/users_rh8/Linux-8_x86_64/users /user

echo "==> Starting sshd..."
/usr/sbin/sshd

echo "==> Starting sssd..."
sssd &

echo "==> Starting autofs..."
automount -f -v &

# Keep container alive
tail -f /dev/null
