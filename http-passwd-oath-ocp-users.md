## How to setup HTPasswd idenity provider for oauth config

1. view the current OAuth configuration 

```
oc get oauth cluster -o yaml

```

2. Update the OAuth configuration

To configure the new idenity provider edit OAuth resources: 

```
oc edit oauth cluster

```

To configure HTPasswd idenity

1. create an HTPasswd file: use the htpasswd ulility to create or update the users
 
 ```
 htpasswd -c -B -b "htpasswd" user1 password1  ##"htpasswd" - file

 ```
 2. create a secrets: store the htpasswd file as secrets:

 ```

 oc create secret generic htpasswd-secret \
   --from-file=htpasswd=httpass-file \
   -n openshift-config

```

3. Update the OAuth:

```
spec:
  identityProviders:
  - name: htpasswd_provider
    mappingMethod: claim
    type: HTPasswd
    htpasswd:
      fileData:
        name: htpasswd-secret
```
4. apply the configuration: The OAuth pods will restart automatically to apply the changes



Updating Users for an htpasswd identity Provider

1. Retrive the htpasswd file from the htpasswd-secret

```

oc get secret htpasswd-secret -n openshift-config -ojsonpath={.data.httpasswd} |base64 --decode > users.htpasswd

```

2. Add or remove new users

# add user
```
htpasswd -bB users.htpasswd <user> <passwd>
```
# remove user
```
htpasswd -D users.htpasswd <user> <pass>
```
3. replace the htpasswd-secret 
```
oc create secret generic htpasswd-secret --from-file=users.htpasswd --dry-run=client -o yaml -n openshift-config |oc replace -f -

4. if you remove one ore more users, you must additionally remove existing resources from each user:
a. Delete the user Object:

```
oc delete user <user>

```

Be sure to remove user , otherwise the user can contine using their token as long as it has not expired

b. delete the identity object

```
oc delete identity htpasswd_provider:<user>

```