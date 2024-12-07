
## Check the Current Partition Layout:

```bash
   lsblk
```

## Use growpart to Expand the Partition (Preferred for Growing Partitions):

```bash
  sudo growpart /dev/sda1
```
  
## resize the filesystem

```bash
  sudo resize2fs /dev/sda1
```
## verify the chagnes

```bash
  df -h
```
