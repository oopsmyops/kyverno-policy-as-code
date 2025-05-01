# Kubernetes workload remediations

These kyverno policies mutate the already existing resource in the cluster to make them compliant to the validation policies.
## Installing the policies
Use kubectl to apply the policies
```sh
kubectl apply -f .
```