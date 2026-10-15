# Deployment & Architecture Documentation

This repository contains the production deployment setup for the **Task Management System** across Docker, Docker Compose, Kubernetes, and Prometheus/Grafana monitoring.

## 1. System Architecture

`
                   +-------------------------------+
                   |       Client / Browser        |
                   +---------------+---------------+
                                   |
                  +----------------+----------------+
                  |                                 |
           (Port 80/8080)                    (Port 3000)
                  |                                 |
                  v                                 v
        +-------------------+              +------------------+
        |  Nginx Container  |              | Grafana Dashboard|
        | (Static Web App)  |              +--------+---------+
        +---------+---------+                       |
                  |                                 | PromQL
            /metrics (port 80)                      | (Port 9090)
                  |                                 v
                  +----------------------> +------------------+
                                           |Prometheus Server |
                                           +------------------+
`

## 2. Milestone Coverage

- **M5: Containerization**:
  - Dockerfile: Production Nginx container serving static HTML/CSS/JS with zero unnecessary layers.
  - docker-compose.yml: Multi-container architecture with application, Prometheus scraper, and Grafana UI on isolated bridge network.
  - Image pushed to GitHub Container Registry (GHCR) via automated CI workflow.

- **M6: Deployment & Monitoring**:
  - Prometheus configuration at monitoring/prometheus.yml scraping every 15 seconds.
  - Alert rules defined at monitoring/alert.rules.yml.
  - Complete Grafana dashboard exported to monitoring/dashboard.json.
  - Deployment proof and monitoring screenshots archived in docs/.

- **M7: Kubernetes Manifests**:
  - k8s/deployment.yaml: High-availability Deployment with 2 replicas, readiness & liveness probes, resource limits.
  - k8s/service.yaml: Service with NodePort: 30080 exposing the application externally.