
# Setup K8s Via Kubeadm ..

Kubeadm is a tool to set up a minimum viable Kubernetes cluster without much complex configuration. Also, Kubeadm makes the whole process easy by running a series of prechecks to ensure that the server has all the essential components and configs to run Kubernetes.
It is developed and maintained by the official Kubernetes community.

## Kubeadm Setup Prerequisites

- Minimum two Ubuntu nodes [One master and one worker node]. You can have more worker nodes as per your requirement.
- The master node should have a minimum of 2 vCPU and 2GB RAM.
- For the worker nodes, a minimum of 1vCPU and 2 GB RAM is recommended.
10.X.X.X/X network range with static IPs for master and worker nodes. We will be using the 192.x.x.x series as the pod network range that will be used by the Calico network plugin. Make sure the Node IP range and pod IP range don’t overlap.

## Kubernetes Cluster Setup Using Kubeadm

- Install container runtime on all nodes- We will be using cri-o.
- Install Kubeadm, Kubelet, and kubectl on all the nodes.
- Initiate Kubeadm control plane configuration on the master node.
- Save the node join command with the token.
- Install the Calico network plugin (operator).
- Join the worker node to the master node (control plane) using the join command.
- Validate all cluster components and nodes.
- Install Kubernetes Metrics Server
- Deploy a sample app and validate the app

## Servers.

We use AWS for create our servers using Ec2 with nedded security groups for 
Access to kubernetes API is restricted to specific IP addresses.

## How to run this project.

``` 
git clone https://github.com/YahiaMohamed90/Cyshield-Tasks.git

# get all files & scripts needed .

cd ~/python-app/Cyshield-Tasks/Task-3-k8s

# change to project directoty
```

### Master & Worker Node Tools Setup.

```
  chmod +x general-dep.sh 

 . general-dep.sh 
```
### After execute general-dep.sh script. All tools needed on all nodes 

- container run time ( CRI-O )
- kubeadm
` kubectl
- kubelet

### Be sure script is executed on Master & Worker Node

## Initialize Kubeadm On Master Node To Setup Control Plane

``` 
chmod +x master.sh

. master.sh

```

### After master.sh script is executed successfully should get join command so we can join worker node with the control plane .

``` 
sudo kubeadm join 10.128.0.37:6443 --token j4eice.33vgvgyf5cxw4u8i \
    --discovery-token-ca-cert-hash sha256:37f94469b58bcc8f26a4aa44441fb17196a585b37288f85e22475b00c36f1c61

# this command must run on worker node ec2 .

```

# License

[Setup-Guilde](https://devopscube.com/setup-kubernetes-cluster-kubeadm/)

# Monitoring Recommendations

For monitoring the application, consider the following stack:

### Metrics Collection

- Prometheus: Collects cluster and application metrics.

- Node Exporter: Provides node-level metrics.

- cAdvisor: Monitors resource usage of containers.

### Visualization

- Grafana: Dashboards for visualizing cluster and application performance.

### Logging

- Fluentd or Filebeat: Log collection and forwarding.

- Elasticsearch or Loki: Log storage and search.

### Alerting

- Alertmanager: Triggers alerts based on Prometheus rules.

By implementing this monitoring stack, you can gain insights into application performance, detect anomalies, and ensure high availability.




