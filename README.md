# ArgoCD Helm Template MCAS project
This is the template that after boostrap by using terraform/opentofu, the Argocd from this repo https://github.com/tuthan/multi-cloud-agnostic-sample/ will use as one of deployment source
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

1. Clone the repository:
   ```bash
   git clone https://github.com/tuthan/argocd-app-templates.git
   cd argocd-helm-template
   ```

2. Customize the `values.yaml` or/and `version.yaml` file to match your environment and requirements. See https://github.com/tuthan/multi-cloud-agnostic-sample/tree/main/k8s 

3. Deploy the application with ArgoCD. See https://github.com/tuthan/multi-cloud-agnostic-sample/

### 🔗 Accessing Components

- **MongoDB**: Access the MongoDB via port-forwarding or a configured Ingress.
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
