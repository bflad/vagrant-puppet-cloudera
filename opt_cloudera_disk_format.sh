if ! mountpoint /opt/cloudera; then
  pvcreate /dev/sdb
  vgcreate vg01 /dev/sdb
  lvcreate -l '100%FREE' vg01
  mkfs -t ext4 /dev/vg01/lvol0
  echo "/dev/mapper/vg01-lvol0  /opt/cloudera ext4    defaults        1 1" >> /etc/fstab
  mkdir /opt/cloudera
  mount /opt/cloudera
fi
# Exit 0 if we're successfully mounted
mountpoint /opt/cloudera
