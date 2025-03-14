## Commands

| Command | Description |
|---------|-------------|
| `kubectl config current-context` | Check current cluster context |
| `kubectl config get-contexts` | List all available clusters in kubeconfig |
| `kubectl cluster-info` | `--context <cluster name>` Get cluster information |
| `ls ~/.kube/` | Check Available kubeconfig Files |
| `kubectl get pods` | List all pods in the current namespace |
| `kubectl get pods -A` | List all pods across all namespaces |
| `kubectl get pods -o wide` | Lists where pods are running (IP) |
| `kubectl get pod <podname> -o yaml` | See the complete yaml output of a pod |
| `kubectl get services` | List all services in the current namespace |
| `kubectl get nodes` | List all nodes in the cluster |
| `kubectl describe pod <pod-name>` | Show detailed information about a pod |
| `kubectl logs <pod-name>` | View logs of a pod |
| `kubectl exec -it <pod-name> -- /bin/sh` | Open a shell inside a running pod |
| `kubectl apply -f <file>.yaml` | Apply a configuration file |
| `kubectl create -f <file>.yaml` | Create resources from a YAML file |
| `kubectl delete pod <pod-name>` | Delete a pod |
| `kubectl get namespaces` | List all namespaces |
| `kubectl delete namespace <namespace>` | Delete a namespace |
| `kubectl get events` | View cluster events |
| `kubectl top pod` | Show resource usage of pods |
| `kubectl top node` | Show resource usage of nodes |
| `kubectl config get-contexts` | List all Kubernetes contexts |
| `kubectl config use-context <context>` | Switch to a different Kubernetes context |
Deployment
| `kubectl apply -f nginx-deployment.yaml` | Applies changes to an existing Deployment or creates it if it doesn't exist |
| `kubectl create -f nginx-deployment.yaml` | Creates a Deployment yaml file |
| `kubectl get deployments` | Applies changes to an existing Deployment or creates it if it doesn't exist |
| `kubectl describe deployment nginx-deployment` | Displays detailed information about a specific Deployment |
| `kubectl scale deployment <deployment-name> --replicas=<num>` | Scale a deployment |
| `kubectl expose deployment <deployment-name> --type=NodePort --port=<port>` | Expose a deployment as a service |
Cloud Providers
| `kubectl config use-context <context>` | list clusters in AWS EKS |
| `az aks list --output table` | list clusters in AWS AKS |
Kind
| `kind get clusters` | Lists clusters |
| `kind create cluster --name <cluster name>` | Creates your kind cluster |
| `kind delete cluster --name <cluster name>` | Deletes your kind cluster |