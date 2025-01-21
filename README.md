# ArgoCD Helm Template MCAS project

This repository contains Helm templates for ArgoCD. After being bootstrapped using Terraform/OpenTofu, it serves as one of the deployment sources. More details please visit https://github.com/tuthan/multi-cloud-agnostic-sample/.

![Alt text](images/argocd.png?raw=true "Argocd")

## Features
![Alt text](images/argocd-app-in-app.png?raw=true "Diagram")
### 🌟 Core Components
- **MongoDB Operator**: Manages MongoDB clusters on Kubernetes.
- **MongoDB**: A highly available MongoDB database cluster.
- **Sample Application**: A demo application has frontend and backend that connect to mongodb.

### 📊 Observability
- **Prometheus**: Metrics collection and monitoring.
- **Elasticsearch**: Log storage and search.
- **Grafana**: Visualization and dashboarding for metrics and logs.

### 🛠️ Utilities
- **Fluentd**: Aggregates and forwards logs to Elasticsearch.
- **MongoDump Job**: Automates backups of the MongoDB database.
- **Alternative**: We can extend later to use https://velero.io/ for backup filesystem

### 🔒 Security
- **Kubernetes Cert-Manager**: Handles SSL certificate management for MongoDB.

## Repository Structure
```
├── app/
├── mongodb-operator/
├── mongodb/
├── mdb-sample-app/
├── prometheus/
├── elasticsearch/
├── grafana/
├── fluentd/
├── db-backup/
├── images/
├── run-test.sh
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Kubernetes cluster (v1.23+)
- Helm (v3.0+)
- ArgoCD (v2.0+)

### Installation

1. Customize the `values.yaml` or/and `version.yaml` file to match your environment and requirements. See https://github.com/tuthan/multi-cloud-agnostic-sample/tree/main/k8s 

2. Deploy the application with ArgoCD. See https://github.com/tuthan/multi-cloud-agnostic-sample/

### 🔗 Accessing Components

- **MongoDB**: Access the MongoDB via port-forwarding or a configured Ingress.
- **Prometheus/Grafana Dashboards**: URLs for dashboards can be set up using Ingress resources.
- **Sample Application**: Access your application using the LoadBalancer or Ingress IP.

## ⚙️ Configuration

All configurations are handled via the `values.yaml` file. Below are some key sections to modify:
- **App**: This is the parent argocd application that is the house of other child resources

- **MongoDB Operator**: 
  ```yaml
  mongodbOperator:
    namespace: mongodb
  ```

- **MongoDB Instance**:
  ```yaml
  mongodb:
    replicas: 3
  ```

- **Utilities**:
  ```yaml
    db-backup:
      schedule: "0 2 * * *" 
      mdbConnectionSecret: "mongodb-admin-my-user" # Daily backup at 2 AM
  ```

## 🤝 Run-test.sh

Contributions are welcome! Please submit issues or pull requests to improve this template. Each chart template has an example value file that will be use by run-test.sh to generate the sample output that can commit along if you make any change.

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
