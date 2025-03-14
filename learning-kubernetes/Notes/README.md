# **KUBERNETES FUNDAMENTALS**

## **What is Kubernetes, and why**?

Kubernetes is a platform used to orchestrate the deployment, scaling and management of container based applications, or in simple terms an application management platform. Kubernetes is a large open source project and has a large ecosystem that originates from google. Some capabilities Kubernetes offers are balancing loads between nodes, rolling updates, mounting storage systems, accessing application logs, distributing secrets, debugging applications, monitoring resources and much more.

**Container orchestration** = Ensuring all containers that run specific workflows are scheduled on virtual or physical machines.
**Cluster** = Collection of nodes that provide compute, memory storage, and networkihg resources.
**Node** = A node/minions can be said to be one host its role is to run pods.

## **K8s Architecture**

![Screenshot 2024-11-24 004713](https://github.com/user-attachments/assets/b40e7f83-5dd3-448f-a6eb-20fa92945966)

### **Master Node**: The master node controls everything in the cluster. 

**Kube API Server** - At the heart of the master node is the Kube API server, entry point for all administrative commands. When you tell kubernetes to deploy an application, this is the component that makes it happen.

**ETCD**: Kubernetes memory storing all the cluster data and state. If anything goes down, this is where kubernetes can check to see what is supposed to be running and where.

**Kube Controller Manager**: The cluster supervisor, ensuring the desired state of the cluster matches reality. Corrects anything that goes off course.

**Kube scheduler**: Matchmaker of the cluster, decides which worker node your new pod uses based on resource availability.

**Cloud Controller Manager**: Connects your cluster to your cloud providers API to handle things like load balances, storage, networking and so much more.

### **Worker Nodes**:

**Kubelet**: An agent that talks to the master node to make sure containers are running as they should be.

**Kube-Proxy**: Handles network inside of things, ensuring each pod in the node can communicate with other pods in the cluster.

**Pods**: Wrappers aroud your containers, its what kubernetes actually deploys and manages.

## Kind task Documentation

Kind stands for **K**ubernetes **IN** **D**ocker. Kubectl cannot work without a cluster.

The kind cluster setup. For anything in the module, to test. I will be using this kind cluster. Once a Kind cluster is up, use kubectl to interact with it.

🚫 Kind is designed for local development & testing, not for production. For production, consider EKS, GKE, AKS, or self-hosted Kubernetes clusters.

1) `vi kind-conf.yaml` then entered the script in [vi script](../kind-conf.yaml). This is a multi-node cluster.

2) `kind create cluster --config kind-conf.yaml --name k8s-demo` to create the cluster.

3) `kubectl cluster-info --context kind-k8s-demo` displays cluster info `https://127.0.0.1:43645`

4) `kubectl get pods` displays the pods. only `CrashLoopBack0ff` should be running.

5) `kubectl create deployment nginx --image=nginx` Creates deployment of Nginx. Should get `deployment.apps/nginx created`.

6) `kubectl get pods` & `kubectl get deploy` again, you should see your nginx pod running.

## Pods task Documentation

Pod is the smallest unit. In a Kubernetes definition file (YAML/JSON), it always contains 4 top level fields (root level properties): 

- **apiVersion**: Defines which Kubernetes API version to use for the resource. Different resources belong to different API groups.
- **Kind**: Defines what Kubernetes object you're creating. Whether its a Pod, Service or Deployment etc.
- **Metadata**: Contains name, labels, and annotations to identify the resource.
- **Spec**: This is the main configuration for the resource, what the resource should do, what containers to run, how many replicas, what ports to expose etc.

1) `kubectl get pods` shows only CrashLoopBackOff running.

2) `vi nginx-pod.yaml` Open file and enter the config in [nginx-pod config]](../nginx-pod.yaml)

3) `kubectl apply -f nginx-pod.yaml` Used to apply Kubernetes resource definitions from a file. the `-f` specifies a file or URL containing the resource definition.

4) `kubectl get pods` to confirm the running pods.
   - `kubectl get pods -w` for realtime watching.
   - `kubectl get pods -o wide` displays additional information about pods like Pod IP, node, restarts etc.

### Pod Imperative

In Kubernetes, imperative commands allow you to create, manage, and manipulate resources directly from the command line without needing to define them in YAML files.

`kubectl run <pod-name> --image=<imagename>`

## Deployments task documentation

A Kubernetes Deployment allows for large scale operations and simplifies the process of managing applications, providing a powerful mechanism for rolling updates, scaling, and version control. Multiple pods can be deployed instantly and you can easily upgrade and rollback. 

A deployment's YAML file also contains 4 top level fields (root level properties) but the:
- **apiVersion**: is `apps/v1` (which is used to manage higher level kubernetes objects, like deployments).
- **kind**: is set to `Deployment` rather than pod.
- **metadata**: Contains metadata to help identify and manage the resource, such as name, labels etc.
- **spec**: you can add
  - `replicas` to define the number of copies of your pods you want to run.
  - `selector` which links deployments to the correct pod.
      - `matchLabels` is used to define this.
  - `template` a pod definition nested inside a deployment spec (essential). This is a blueprint for the pod.
     - `spec` The specification for the pods, that will be created by the deployment.

In deployments, if you delete a pod, deployments will automatically deploy another one as you specified 3 pods running.

1) `vi nginx-deploy.yaml` and add create this script [nginx-deploy script](../nginx-deploy.yaml)

2) Apply script with `kubectl apply -f nginx-deploy.yaml`, it will reply with `deployment.apps/nginx-deployment created`

3) `kubectl get deploy`, you'll find 3/3 versions of nginx running.

4) `kubectl delete deploy nginx-deployment` or `kubectl delete -f nginx-deploy.yaml` to delete.

Deployment Imperative can be launched with `kubectl create deploy nginx-deployment --image=nginx --replicas=2`

## Replica Sets documentation

A ReplicaSet in Kubernetes ensures that a specified number of identical Pods are running at any given time. Useful for maintaining the desired state of the application and ensures it remains available, even if individual pods fail.

Deployments manage replica sets for you. They also add special features that replica sets don't have like rolling updates.

**Kind**: Replica set

1) `kubectl create deploy nginx-deployment --image=nginx --replicas=5`output will be deployment.apps/nginx-deployment created.

2) `kubectl get deploy` and you will see 5 pods running.

## Services

A Service is an abstraction that provides a stable endpoint for accessing a set of Pods. In kubernetes pods are ephemeral (temporary). A service helps manage the dynamic nature of pods by providing a stable unchangeable IP, DNS etc. that can let you or others access specific pods.

Three main types of services are:

- **Cluster IP** (default): Exposes the Service only within the Kubernetes cluster. Stable internal IP. Commonly used for internal communication between Pods. This service is only reachable within the cluster (front-end back-end communications)

- **Node Port**: A way to make your service accessible outside the cluster but you don't need the full power of a load balancer. Kubernetes automatically assigns a port from the range `30000-32767` open on every node in the cluster. 

`<Node-IP>:<NodePort>` example: `http://192.168.1.100:30080`.

- **Load balancers**:

When you create a service with a type of (internal) load balancer, kubernetes automatically provisions an *external* load balancer from your cloud provider (like AWS ELB, GCP Load Balancer) to route traffic to the Service inside the Kubernetes cluster. The internal load balancer distributes traffic among your (backend) pods, ensuring your pods share the load evenly. Using the load balancer. Load balancer provides an IP clients can connect to. Useful to make your application accessible to users outside your cluster. Reliability and scalability. An ingress controller creates a load balancer.

## Cluster IP task documentation

How a clusterIP service works. 

Create a service of cluster IP type and expose it. You can create multiple types of kubernetes services/kinds in a simple yaml file but entering **---** under the first one.

1) create the file `vi nginx-svc.yaml` and enter the config in [service config](../nginx-svc.yaml) which includes the deployment and service.

2) Enter `kubectl apply -f nginx-svc.yaml` to apply the config file and `kubectl get svc` to check.

3) There are two ways to test the cluster IP out, one is the *port forward* method:

- **Port forward**: Port forward allows you to access the service cluster IP on your host. It will forward to a port 8080 and access it using port 80. `kubectl port-forward svc/nginx-svc 8080:80`.

## Storage - Persistent storage

In Kubernetes pods are ephemeral, meaning they are designed to be short-lived, persistent storage refers to storage that retains data beyond the lifecycle of a pod. Kubernetes provides a way to manage persistent storage using Persistent Volumes (PVs) and Persistent Volume Claims (PVCs). It ensures data reliability beyond pod lifecycle.

 - **Persistent Volumes (PVs)** - A PV is a piece of storage in the cluster that has been provisioned by an administrator. It is an abstraction over physical storage devices, such as disks, and can be provisioned from a variety of sources (e.g., cloud storage, NFS, iSCSI, etc.).

 - **Persistent Volumes Claim (PVC)** - A PVC is a request for storage by a user. It specifies size, access modes, and storage class. Kubernetes will find a matching PV for the PVC, bind them, and make the storage available to the pod.

 *A StorageClass simply defines the types of storage available in your cluster and allows dynamic provisioning of PVs.*

## ConfigMaps (for configuration data) documentation:

ConfigMaps are a way to store non-sensitive configuration data in a key-value pair format, which can be used by pods or other resources, separating configuration from application code, allowing you to modify configuration settings without having to rebuild or redeploy your container images. Create a ConfigMap named my-config in kubernetes with:

*Note: `--from-literal` specifies literal key-value pairs directly in the command line.*

**Two key-value pairs**
1) Key: APP_COLOUR, Value: blue
2) Key: APP_MODE, Value: production

```
kubectl create configmap my-config --from-literal=APP_COLOUR=blue --from-literal=APP_MODE=production
```
and use: 

- `kubectl get cm` (to view config maps)
- `kubectl get cm my-config -o yaml` (to view yaml file)

There are my ways to inject environment variables and configuration data into a container, such as using a ConfigMap or secrets. For this we will focus on the ConfigMaps method. Below is part of a Kubernetes Pod or Deployment definition for ConfigMaps:

-  Create a pod that uses the above config `vi cm-pod.yaml` and enter config on [cm-pod yaml](../cm-pod.yaml). This full YAML defines a Kubernetes Pod that runs a BusyBox (a lightweight Linux distribution) container. Run the pod with `kubectl apply -f cm-pod.yaml`

A summary of what has happened:
1️⃣ The Pod runs a BusyBox container that prints environment variables and sleeps.
2️⃣ It pulls APP_COLOUR & APP_MODE from a ConfigMap (my-config) and injects them as env vars.
3️⃣ It also mounts my-config as a volume at /etc/config, where each key becomes a file.
4️⃣ This setup gives flexibility—allowing apps to read configs from either env vars or files.

**Useful checks**
1) To check the variables inside the pod, use: `kubectl exec -it cm-demo -- env | grep APP_`
2) To check the value of the APP_COLOUR key from the ConfigMap that was mounted as a file in /etc/config/APP_COLOUR: kubectl exec -it cm-demo -- cat /etc/config/APP_COLOUR.
3) To check the value of the APP_MODE key from the ConfigMap that was mounted as a file in /etc/config/APP_MODE: kubectl exec -it cm-demo -- cat /etc/config/APP_MODE.

## Secrets documentation

Kubernetes Secrets are used to store sensitive information such as passwords, API keys, SSH keys, or TLS certificates securely within a cluster. Unlike ConfigMaps, which store non-sensitive data, Secrets are encrypted and not exposed in plain text. base64 encryption can reveal the password using `echo "bXlwYXNzd29yZA==" | base64 -d`

You can mount secret as volumes or expose/set them as environment variables

1) create secret with `kubectl create secret generic my-secret --from-literal=username=myuser --from-literal=password=mypassword`.
2) To view secret in yaml `kubectl get secrets my-secret -o yaml`
3) generate pod with `kubectl apply -f secret-pod.yaml`
4) and enter pod using `kubectl exec -it secret-demo-pod -- /bin/sh` then view username with `echo $SECRET_USERNAME`. Exit shell with `exit`.

✅ This Pod retrieves sensitive credentials from a Secret called my-secret.
✅ It makes these credentials available both as environment variables and as files inside a mounted volume.
✅ This approach improves security by not hardcoding credentials inside the Pod spec.
