## boot the system with ISO image

## Check the Current Partition Layout:

```bash
   lsblk
```

## Use growpart to Expand the Partition (Preferred for Growing Partitions):

```bash
  sudo growpart /dev/sda 1
```
  
## resize the filesystem

```bash
  sudo e2fsck -f /dev/sda1
  sudo resize2fs /dev/sda1
```
## verify the chagnes

```bash
  df -h
```
