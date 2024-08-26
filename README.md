# Docker Logs Monitoring with Loki, Promtail, and Grafana

## Overview

This project provides a complete setup for collecting, storing, and visualizing logs from Docker containers using Loki, Promtail, and Grafana. The setup is designed to automatically capture logs from any Docker container running on the host, store them in an Amazon S3 bucket using Loki, and visualize them in Grafana. HashiCorp Vault is used to securely manage AWS credentials.

## Components

- **Promtail**: A log collection agent that scrapes logs from Docker containers and sends them to Loki.
- **Loki**: A log aggregation system that stores the logs in an Amazon S3 bucket.
- **Grafana**: A visualization tool to display the logs stored in Loki.
- **HashiCorp Vault**: Used for securely managing and retrieving AWS credentials needed by Loki.

## Features

- **Automatic Log Collection**: Promtail automatically detects and collects logs from all running Docker containers on the host.
- **Secure Storage**: Logs are securely stored in an Amazon S3 bucket using credentials managed by HashiCorp Vault.
- **Real-time Visualization**: Grafana is configured to visualize logs stored in Loki, providing powerful query capabilities.
- **Scalable and Durable**: By storing logs in S3, the system ensures scalability and durability.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- Access to an Amazon S3 bucket.
- HashiCorp Vault configured and running.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com//R-D-Y/k8s-Observability.git
cd k8s-Observability
```

### 2. Configure HashiCorp Vault

1. Install and configure HashiCorp Vault on your machine or on a dedicated server.
2. Store your AWS credentials in Vault:

    ```bash
    vault kv put secret/loki aws_access_key_id=<your-access-key> aws_secret_access_key=<your-secret-key>
    ```

3. Ensure that Vault is accessible from the machine running this project.

### 3. Modify the Configuration Files

- **loki-config.yaml**: Ensure the S3 bucket name, region, and Vault variables are correctly set.
- **docker-compose.yml**: Update the Vault address and token to match your environment.

### 4. Start the Stack

Run the following command to start Loki, Promtail, and Grafana:

```bash
docker-compose up -d
```

### 5. Access Grafana

Once the stack is running, you can access Grafana by navigating to `http://localhost:3000` in your web browser.

- **Default login**: 
  - Username: `admin`
  - Password: `admin`

### 6. Configure Grafana to Use Loki

1. In Grafana, go to **Configuration > Data Sources**.
2. Click **Add data source** and select **Loki**.
3. Set the URL to `http://loki:3100` and click **Save & Test**.

### 7. Visualize Logs

Create dashboards and panels in Grafana to query and visualize the logs being collected and stored by Loki.

## Project Structure

```
├── docker-compose.yml
├── loki-config.yaml
├── promtail-config.yaml
├── start-loki.sh
└── README.md
```

- **docker-compose.yml**: Docker Compose file to orchestrate Loki, Promtail, and Grafana.
- **loki-config.yaml**: Configuration for Loki to store logs in S3.
- **promtail-config.yaml**: Configuration for Promtail to collect logs from Docker containers.
- **start-loki.sh**: Script to start Loki with AWS credentials fetched from Vault.
- **README.md**: This documentation.

## Security Considerations

- **Secrets Management**: AWS credentials are securely managed using HashiCorp Vault to prevent them from being exposed in plain text.
- **Data Durability**: By storing logs in S3, the system ensures high durability and availability.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes or improvements.
