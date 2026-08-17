# Azure Architecture & Core Concepts Notes

Understanding the foundational architecture of Microsoft Azure requires a clear mental model of how cloud resources are organized, governed, and secured.

> **Key Takeaway:** The Microsoft Azure Fundamentals AZ-900 domain establishes this baseline across core cloud concepts, resource organization, compute/storage services, and security boundaries.

## 1. The Shared Responsibility Model

As workloads transition to the cloud, responsibility shifts between the customer and Microsoft:

* **Infrastructure as a Service (IaaS):** Microsoft manages physical data centers, host hardware, and physical networking. The customer maintains OS, networking, applications, and data.
* **Platform as a Service (PaaS):** Microsoft adds OS patching, database runtime, and middleware management. The customer focuses strictly on application logic and data.
* **Software as a Service (SaaS):** The provider manages virtually the entire stack; the customer controls access, user permissions, and data security.

## 2. Azure Governance & Resource Hierarchy

Azure organizes resources using a strict logical hierarchy:

* **Management Groups:** Manage access, policy, and compliance across multiple subscriptions simultaneously.
* **Subscriptions:** Serve as billing and access management boundaries.
* **Resource Groups:** Logical containers holding resources that share the same deployment and management lifecycle.
* **Resources:** Individual assets like VMs, storage accounts, or SQL databases.

## 3. Global Infrastructure & Availability

* **Regions:** Geographical areas containing latency-defined data centers.
* **Region Pairs:** Paired regions at least 300 miles apart for disaster recovery.
* **Availability Zones:** Physically separate data centers within a region providing high availability against local power or network outages.

## 4. Core Compute Options

* **Azure Virtual Machines:** Full OS control for legacy migration or specialized server setups.
* **Azure App Service:** Fully managed PaaS for web applications with auto-scaling.
* **Azure Container Instances (ACI) & AKS:** Lightweight container execution without host provisioning, or enterprise Kubernetes orchestration.

## 5. Storage Tiers & Redundancy Models

Blob Storage Access Tiers:
* **Hot Tier:** Frequently accessed data.
* **Cool Tier:** Lower storage costs for data stored at least 30 days.
* **Cold Tier:** Infrequently accessed data stored for at least 90 days.
* **Archive Tier:** Lowest cost for long-term retention (180+ days) where retrieval latency is acceptable.

Redundancy Options:
* **LRS (Locally Redundant Storage):** 3 copies within a single data center.
* **ZRS (Zone Redundant Storage):** Replicated across 3 Availability Zones in the primary region.
* **GRS (Geo-Redundant Storage):** Cross-region replication to protect against regional disasters.

## 6. Identity & Access Control

> Microsoft Entra ID serves as the primary security perimeter for cloud resources.

* **Microsoft Entra ID:** Handles authentication, single sign-on, and user directory management.
* **Azure RBAC:** Controls what actions a user can perform at specific scopes (Management Group, Subscription, or Resource Group).
* **Azure Policy & Resource Locks:** Enforce regulatory compliance automatically and prevent accidental resource deletion.
