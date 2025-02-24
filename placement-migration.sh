## get placemetRule




get_matchexpressions() {
  local placementRuleName=$1
  local namespace=$2
  local matchExpressions=$(oc get placementrule ${placementRuleName} -n ${namespace} -o jsonpath='{.spec.clusterSelector.matchExpressions}')
  echo ${placementRuleName}
  echo ${matchExpressions}
  patch_matchexpressions_placement ${placementRuleName} ${namespace} ${matchExpressions}

patch_matchexpressions_placement() {
  local defaul_placement='{
    "apiVersion": "cluster.open-cluster-management.io/v1beta1",
    "kind": "Placement",
    "metadata": {
        "name": "placement",
        "namespace": "acm-config"
    },
    "spec": {
        "predicates": [
            {
                "requiredClusterSelector": {
                    "labelSelector": {
                        "matchExpressions": [
                            {
                                "key": "name",
                                "operator": "In",
                                "values": [
                                    "local-cluster"
                                ]
                            }
                        ]
                    }
                }
            }
        ]
    }}'

  local placementRuleName=$1
  local namespace=$2
  local matchExpressions=$3

  defaul_placement=$(echo ${defaul_placement} | jq '.spec.predicates[0].requiredClusterSelector.labelSelector.matchExpressions[0].values = ['${matchExpressions}']' )
  #change the placement Name
  defaul_placement=$(echo ${defaul_placement} | jq '.metadata.name = "'${placementRuleName}'"' )

}

mani() {

    for i in $(oc get placementrule -n acm-config --no-headers | awk '{print $1}'); do
        echo "placementRule: $i"
        get_matchexpressions $i acm-config
    done
}

mani


#python -c 'import sys, json, yaml; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < placement.json > placement.yaml
