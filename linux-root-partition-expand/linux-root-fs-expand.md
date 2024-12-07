
1. Check the Current Partition Layout:

  lsblk

2. Use growpart to Expand the Partition (Preferred for Growing Partitions):

  sudo growpart /dev/sda1
  
  resize the filesystem
  
  sudo resize2fs /dev/sda1

3. verify the chagnes

  df -h
