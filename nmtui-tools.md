## if netowrk tools unable to detect ethernet cards

## check if eth is Managed by NetworkManager

networkManager may not by managing the interface

Command
```
bash

nmcli device status

```

Expected Output

```
eth2 enthernet unmanaged
```
 * if eth2 is umanaged: 
  

## create a New connection for device
```
nmcli connection add type ethernet con-name eth2-con ifname eth2
```

## Edit network to assign the ipaddress

## bring up the interface

```
nmcli connectioon up eth2

```