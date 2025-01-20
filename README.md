# ArgoCD Helm Template MCAS project
![Alt text](images/argocd.png?raw=true "Argocd")
This repository provides a sample ArgoCD Helm template designed to support app-in-app deployment. It includes essential components for a scalable, observable, and secure Kubernetes-based architecture.

## Features
![Alt text](images/argocd-app-in-app.png?raw=true "Diagram")
### 🌟 Core Components
- **MongoDB Operator**: Manages MongoDB clusters on Kubernetes.
- **MongoDB**: A highly available MongoDB database instance.
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
├── mongodb-operator/
├── mongodb/
├── sample-application/
├── prometheus/
├── elasticsearch/
├── grafana/
├── fluentd/
├── db-backup/
├── cert-mgmt/
├── run-test.sh
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Kubernetes cluster (v1.23+)
- Helm (v3.0+)
- ArgoCD (v2.0+)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/tuthan/argocd-app-templates.git
   cd argocd-helm-template
   ```

2. Customize the `values.yaml` file to match your environment and requirements. See https://github.com/tuthan/multi-cloud-agnostic-sample/tree/main/k8s 

3. Deploy the application with ArgoCD. See https://github.com/tuthan/multi-cloud-agnostic-sample/

### 🔗 Accessing Components

- **MongoDB Dashboard**: Access the MongoDB Operator dashboard via port-forwarding or a configured Ingress.
- **Prometheus/Grafana Dashboards**: URLs for dashboards can be set up using Ingress resources.
- **Sample Application**: Access your application using the LoadBalancer or Ingress IP.

## ⚙️ Configuration

All configurations are handled via the `values.yaml` file. Below are some key sections to modify:

- **MongoDB Operator**: 
  ```yaml
  mongodbOperator:
    enabled: true
    namespace: mongodb-operator
  ```

- **MongoDB Instance**:
  ```yaml
  mongodb:
    replicas: 3
    storageSize: 10Gi
  ```

- **Observability**:
  ```yaml
  observability:
    prometheus:
      enabled: true
    elasticsearch:
      enabled: true
    grafana:
      enabled: true
  ```

- **Utilities**:
  ```yaml
  utilities:
    fluentd:
      enabled: true
    mongodump:
      schedule: "0 2 * * *"  # Daily backup at 2 AM
    certManager:
      enabled: true
  ```

## 🤝 Run-test.sh

Contributions are welcome! Please submit issues or pull requests to improve this template. Each chart template has an example value file that will be use by run-test.sh to generate the sample output that can commit along if you make any change.

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
