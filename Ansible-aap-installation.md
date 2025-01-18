I was receving following error druing the aap installation: 

```
certificate verify failed: unable to get local issuer certificate (_ssl.c:1147)>"
```

The fix i found was reinstall the ca-certificates

```
yum reinstall ca-certificates.noarch

```

```
inventory:

[automationcontroller]
192.168.34.11 ansible_connection=local

[database]
192.168.34.21
[redis]
192.168.34.22 ansible_connection=local
[automationgateway]
192.168.34.21

[all:vars]
redis_mode=standalone
admin_password='YourSecurePassword'
pg_host='localhost'
pg_port='5432'
pg_database='awx'
pg_username='awx'
pg_password='YourDBSecurePassword'
redis_password='YourRedisPassword'
redis_host=localhost
redis_port=6379
redis_cluster=false
allow_collocation=True

[all:vars]


automationgateway_admin_password='db'
automationgateway_pg_database='db'
automationgateway_pg_username='db'
automationgateway_pg_password='db'
#automationgateway_pg_host=192.168.34.21

```





