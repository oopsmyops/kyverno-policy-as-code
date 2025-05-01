# Kubernetes policy enforcement
Policies which are selected from the best-practices are mutated using kustomize to be enforced. See:  [validationFailureAction](https://kyverno.io/docs/policy-types/cluster-policy/policy-settings/#:~:text=validationFailureAction%3A%20controls%20if,validate%20rule%20instead.)
```yaml
patches:
  - patch: |-
      - op: replace
        path: /spec/validationFailureAction
        value: Enforce
    target:
      kind: ClusterPolicy
```

## Installing the policies
Use [kustomize](https://github.com/kubernetes-sigs/kustomize) to apply the policies
```sh
kubectl apply -k .
```