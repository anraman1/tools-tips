
##imageset.yaml

```
apiVersion: mirror.openshift.io/v1alpha2
kind: ImageSetConfiguration
storageConfig:
  local:
    path: /tmp/mirror
mirror:
  operators:
  - catalog: registry.redhat.io/redhat/redhat-operator-index:v4.14
    packages:
    - name: rhacs-operator
      channels:
      - name: rhacs-4.5
        maxVersion: 4.5.5
        minVersion: 4.5.5
```

To create index-image

```
oc-mirror --config image-set.yaml file://imageset

```

To push the image

```

oc-mirror --from imageset/mirror_seq1_000000.tar docker://localhost:5000/namespace  --dest-skip-tls

```

curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

mkdir -p ${HOME}/.config/kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator

curl -O https://github.com/open-cluster-management-io/policy-generator-plugin/releases/download/v1.16.0/linux-amd64-PolicyGenerator

