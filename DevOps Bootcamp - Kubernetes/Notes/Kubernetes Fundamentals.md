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
