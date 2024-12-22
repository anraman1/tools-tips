I was receving following error druing the aap installation: 

```
certificate verify failed: unable to get local issuer certificate (_ssl.c:1147)>"
```

The fix i found was reinstall the ca-certificates

```
yum reinstall ca-certificates.noarch

```

