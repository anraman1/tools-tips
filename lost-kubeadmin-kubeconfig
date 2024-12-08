# How to get admin access even if you lost kuebadmin and kubeconfig

##control plane node will have secrets for their static pods
```
search for secrets/token on /etc/ folders

find /etc/ -name tokens

output

find . -name token
./kubernetes/static-pod-resources/kube-controller-manager-pod-7/secrets/localhost-recovery-client-token/token
./kubernetes/static-pod-resources/kube-apiserver-pod-12/secrets/localhost-recovery-client-token/token
./kubernetes/static-pod-resources/kube-scheduler-pod-6/secrets/localhost-recovery-client-token/token
./kubernetes/static-pod-resources/kube-apiserver-pod-14/secrets/localhost-recovery-client-token/token

cat ./kubernetes/static-pod-resources/kube-apiserver-pod-14/secrets/localhost-recovery-client-token/token

using this token i was able to login as admin again

and then i create users with admin cluster role

```



