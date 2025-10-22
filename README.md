# Inception of Things (IoT)

## 📋 Description

**Inception of Things** is a hands-on project focused on discovering and learning Kubernetes (K3s) and modern DevOps technologies. This project is structured in several progressive parts to master container orchestration, application deployment, and continuous integration.

## 🎯 Project Objectives

This project aims to:
- Understand Kubernetes fundamentals through K3s (lightweight Kubernetes distribution)
- Learn to configure and manage Kubernetes clusters
- Master containerized application deployment
- Discover CI/CD and GitOps tools (ArgoCD)
- Automate infrastructure with Vagrant and provisioning tools

## 🏗️ Project Structure

The project is divided into three progressive parts:

### Part 1 - K3s and Vagrant Setup
Configuration of a virtual environment with Vagrant and installation of K3s in server and agent mode.

**Usage:**
```bash
cd part-1
vagrant up
```

### Part 2 - Application Deployment
Deployment of multiple applications in the K3s cluster with service and ingress configuration.

**Usage:**
```bash
cd part-2
vagrant up
```

### Part 3 - CI/CD with K3d and ArgoCD
Setting up a CI/CD pipeline with K3d (K3s in Docker) and ArgoCD for automated deployment.

**Usage:**
```bash
cd part-3
./setup.sh
```

## 🛠️ Technologies Used

- **K3s** - Lightweight Kubernetes distribution
- **K3d** - K3s in Docker for development
- **Vagrant** - Virtual machine management
- **ArgoCD** - GitOps continuous deployment
- **Docker** - Containerization

## 📦 Prerequisites

- VirtualBox or another Vagrant-compatible hypervisor
- Vagrant
- kubectl (Kubernetes client)
- Docker (for part 3)

## 🚀 Quick Start

Each part can be run independently:

```bash
# Part 1
cd part-1 && vagrant up

# Part 2
cd part-2 && vagrant up

# Part 3
cd part-3 && ./setup.sh
```

## 📚 Resources

- [K3s Documentation](https://k3s.io/)
- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)

## 👤 Author

**0xmamoud**

## 📄 License

This project is developed for educational purposes.
