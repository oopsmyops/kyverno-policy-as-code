# Kyverno Policies

This directory contains a set of Kyverno policies curated for Kubernetes.

## Installing Policies

**Clone Repository:**

Clone the kyverno-policies repository.

```console
git clone https://github.com/oopsmyops/kyverno/policy-as-code.git
```

**Install Policies:**

To install Kubernetes Best Practices policies, refer to [best-practices/README.md](best-practices/README.md). These policies are applied in Audit mode

To install enforce policies, refer to [enforce/README.md](enforce/README.md)

Once policies are installed, you can check if they are ready using the command:

```console
kubectl get cpol
```