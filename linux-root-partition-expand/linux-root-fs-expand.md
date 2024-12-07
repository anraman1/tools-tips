
## Check the Current Partition Layout:

   lsblk

## Use growpart to Expand the Partition (Preferred for Growing Partitions):

  sudo growpart /dev/sda1
  
  resize the filesystem
  
  sudo resize2fs /dev/sda1

## verify the chagnes

  df -h
