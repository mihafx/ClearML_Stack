# ClearML_Stack
Production-grade self-hosted deployment of ClearML using Docker Compose.
This repository implements a **production-oriented self-hosted deployment of ClearML** using Docker Compose.  
The setup is designed with **infrastructure isolation**, **service segmentation**, and **scalability** in mind.

---

## 📐 System Architecture & Service Responsibilities
<img width="974" height="695" alt="clearml_schema" src="https://github.com/user-attachments/assets/77ca089f-dc7e-48c4-a6d9-8cc6b2a0034f" />


The system follows a layered architecture:

1. **Ingress Layer**  
2. **Application Layer**  
3. **State & Data Layer**  
4. **Execution Layer**  

### Ingress Layer

**Nginx (Reverse Proxy / Entry Point)**  

Acts as the single ingress boundary of the system.

**Responsibilities:**

- Centralized traffic routing  
- API/UI request segregation  
- Future TLS termination point  
- Security enforcement (rate limiting, headers, IP policies)  
- Decouples public exposure from internal services  

---

### Application Layer

**ClearML API Server**

- Core orchestration and metadata management component  
- System control plane  
- Experiment lifecycle management  
- Task orchestration  
- Metadata persistence coordination  
- Communication hub between storage, indexing, and execution layers  

**ClearML Web Server**

- Presentation and interaction layer  
- Read-only and interactive visualization interface  
- Observability for experiment tracking  
- Stateless, relies on API server for control  

**ClearML File Server**

- Artifact persistence gateway  
- Binary artifact storage abstraction  
- Centralized model and dataset persistence  
- Decouples execution layer from storage  
- Scalable artifact management  

---

### State & Data Layer

**MongoDB (Primary Metadata Store)**

- System-of-record for structured state  
- Persistent metadata storage (task definitions, config state)  
- Provides transactional durability and long-term consistency  

**Redis (Ephemeral State & Messaging)**

- Low-latency coordination layer  
- Queue backend, caching, inter-service signaling  
- Reduces load on persistent storage  

**Elasticsearch (Observability & Indexing Engine)**

- Search and log analytics subsystem  
- High-performance log indexing  
- Metric filtering and aggregation  
- Operational visibility  

---

### Execution Layer

**ClearML Agent Services**

- Distributed compute execution engine  
- Pull-based task execution  
- Containerized experiment runtime  
- Reproducible execution environment  
- Horizontal scaling of compute workers  
- Decouples orchestration from computation  

---

## ⚙️ Architectural Principles Applied

1. **Network Segmentation** – Public-facing components isolated from data services  
2. **Separation of Concerns** – Each layer has well-defined responsibilities  
3. **Horizontal Scaling Readiness** – Stateless services can be replicated; execution layer scales independently  
4. **Persistent Storage Strategy** – Named Docker volumes, clear separation between ephemeral and durable state  
5. **Production-Oriented Resource Governance** – Healthchecks, restart policies, Elasticsearch heap configuration  

---

## 🚀 Setup & Deployment

### Prerequisites

- Docker ≥ 24.0  
- Docker Compose ≥ 2.0  

### Steps

1. Clone the repository:

```bash
git clone https://github.com/username/repo.git
cd repo
