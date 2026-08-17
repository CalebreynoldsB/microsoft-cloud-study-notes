# Azure & Microsoft Cloud Learning Journal 🟦

Hey there! 👋 Welcome to my personal Microsoft Azure learning hub.

I’m a student currently exploring cloud computing, Azure infrastructure, enterprise identity management, and Microsoft certifications. I built this repository to log my study progress, break down core Azure services, and document all the lessons I learn while building projects using the Azure Free Account.

---

## 💡 A Student's Perspective on Learning Azure

Coming into the Microsoft Cloud ecosystem, the sheer number of security controls and resource management layers can feel pretty overwhelming. But once you get hands-on, you realize how logical and enterprise-ready the entire platform is!

### My Key Principles for Studying Azure:
* **Resource Groups First**: Always organize your lab resources cleanly! Creating a dedicated Resource Group for every mini-project makes cleanup super easy so you don't accidentally burn through your free trial credits. 😅
* **Identity is the New Perimeter**: Understanding Microsoft Entra ID (formerly Azure AD) is mandatory. In Azure, security always starts with proper Role-Based Access Control (RBAC).
* **CLI > Portal for Speed**: While the Azure Portal is great for visual learning, practicing commands in Azure Cloud Shell (Bash/PowerShell) speeds up deployment workflows significantly.

---

## 🎯 Key Topics & Core Architecture Notes

### 1. Identity & Access Management (IAM)
* **Microsoft Entra ID**: Managing users, groups, dynamic memberships, and Conditional Access policies.
* **Azure RBAC**: Assigning built-in roles (`Owner`, `Contributor`, `Reader`) vs. custom roles at different scope levels (Management Group -> Subscription -> Resource Group -> Resource).

### 2. Compute & Networking
* **Virtual Networks (VNets) & Subnets**: Designing private IP spaces, Network Security Groups (NSGs), and VNet Peering for secure communication.
* **Azure VMs & App Services**: Choosing between IaaS virtual machines for custom environments vs. PaaS web apps for rapid code deployment.

### 3. Storage & Databases
* **Azure Blob Storage**: Blob tiers (Hot, Cool, Cold, Archive) and lifecycle management rules to minimize storage costs.
* **Azure SQL Database & Cosmos DB**: Managed relational SQL databases vs. globally distributed multi-model NoSQL storage.

---

## 📂 Repository Structure

### 📘 Exam Resources & Guides
* [`AZ-900-Resources.md`](./AZ-900-Resources.md) - Fundamentals exam prep, official docs, and reference links.
* [`AZ-104-Resources.md`](./AZ-104-Resources.md) - Administrator track guide, practice questions, and study logs.
* [`AZ-500-Resources.md`](./AZ-500-Resources.md) - Security Engineer study guide, labs, and domain breakdown.

### 📝 Architecture & Concept Notes
* [`notes/AZ-900-Core-Architecture.md`](./notes/AZ-900-Core-Architecture.md) - Core Azure concepts and shared responsibility model.
* [`notes/AZ-500-Security-Architecture.md`](./notes/AZ-500-Security-Architecture.md) - Zero Trust principles, Key Vault, and SecOps notes.

### 🛠️ Practice Scripts
* [`scripts/`](./scripts/) - Azure CLI & PowerShell automation snippets for hands-on labs.

---

### ⏱️ My Ongoing Learning Roadmap

- [x] Set up Azure Free Account and configure budget limits / billing alerts
- [x] Deploy a multi-tier web app using Azure App Service and Azure SQL
- [ ] Configure VNet Peering and route traffic using Network Security Groups
- [ ] Practice scenario-based practice questions for the AZ-104 exam

*Thanks for stopping by! Feel free to star ⭐️ this repo if you're also on your Microsoft Cloud learning journey.*
