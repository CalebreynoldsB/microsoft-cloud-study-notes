# Microsoft Azure Administrator (AZ-104) Exam Prep & Study Guide

Welcome to my comprehensive study guide and notes for the **Microsoft Certified: Azure Administrator Associate (`AZ-104`)** exam.

This repository serves as my personal knowledge log for hands-on experiments, core architecture patterns, network design blueprints, and administration practices on Microsoft Azure.

---

## 1. Official Exam Links & Resources

* **Official Certification Page:** [Microsoft Certified: Azure Administrator Associate](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/)
* **Official Exam Details & Skills Measured:** [AZ-104 Exam Outline & Objectives](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104)
* **Official Learning Paths:** [Microsoft Learn AZ-104 Training Modules](https://learn.microsoft.com/en-us/training/courses/az-104t00)
* **Official Interactive Labs:** [Microsoft Learning AZ-104 Hands-On GitHub Labs](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator)

---

## 2. Study Reflections & Administrative Mindset

Preparing for the **AZ-104** exam requires a shift from theoretical cloud knowledge to practical administrative execution. The exam tests heavily on **troubleshooting, command-line operations (Azure CLI and PowerShell), routing logic, and resource governance**.

### Core Lessons Learned:
* **Networking is Paramount:** Virtual Networks (VNets), VNet Peering, User-Defined Routes (UDRs), Azure Load Balancer, Application Gateway, and Network Security Groups (NSGs) represent a huge portion of the exam.
* **Identity & Governance Foundation:** Understanding Microsoft Entra ID (Users, Groups, Administrative Units, Licenses), Management Groups, Subscriptions, and Azure Policy ensures control over multi-tenant architectures.
* **Storage & Compute Operations:** Knowing exact deployment options for Azure VMs, Virtual Machine Scale Sets (VMSS), Azure App Service, and Storage Account replication strategies (LRS, ZRS, GRS, GZRS) is essential.

---

## 3. Learning Phases, Key Challenges & Recommended Materials

### Phase 1: Identity & Governance (15–20%)
* **Focus:** Microsoft Entra ID object management, Self-Service Password Reset (SSPR), Role-Based Access Control (RBAC) inheritance, Management Group hierarchies, Azure Policy, and Resource Locks.
* **Key Challenge / Bottleneck:** Dissecting custom RBAC JSON definitions (`Actions`, `NotActions`, `DataActions`, `AssignableScopes`) and understanding how `Deny` assignments override allowed permissions.
* **Valuable Materials:**
  * Official MS Learn Modules on Azure Governance.
  * Hands-on practice creating custom RBAC roles using Azure CLI/PowerShell.

### Phase 2: In-Depth Virtual Networking (20–25%)
* **Focus:** Subnetting, VNet Peering (Transitive vs. Non-transitive routing), Azure Firewall, NSG evaluation rules, Azure DNS (Public & Private Zones), Load Balancer (Internal vs. Public), and Application Gateway.
* **Key Challenge / Bottleneck:** Calculating rule priorities in NSGs (effective security rules) and configuring custom User-Defined Routes (UDRs) with `NextHopType` set to `VirtualAppliance`.
* **Valuable Materials:**
  * Microsoft Learning GitHub Labs (*Lab 04: Implement Virtual Networking*).
  * Community study logs and practical tips like this [AZ-104 exam preparation journal](https://telegra.ph/How-I-Passed-the-Microsoft-Azure-AZ-104-Exam--Prep-Guide-08-17) for quick revision and scenario breakdowns.

### Phase 3: Azure Compute Resources (20–25%)
* **Focus:** Azure Virtual Machines, Availability Sets vs. Availability Zones, Virtual Machine Scale Sets (VMSS) auto-scaling rules, Azure App Service Plans, and Azure Container Instances (ACI).
* **Key Challenge / Bottleneck:** Understanding update domains and fault domains in Availability Sets, as well as App Service deployment slots and custom domain bindings.
* **Valuable Materials:**
  * Interactive Azure Portal deployments using Azure Free Trial credits.

### Phase 4: Storage & Monitoring / Backup (25–30%)
* **Focus:** Storage Account types, Blob Access Tiers (Hot, Cool, Cold, Archive), Azure Files & Azure File Sync, Shared Access Signatures (SAS), Azure Backup (Recovery Services Vaults), and Azure Monitor / Log Analytics.
* **Key Challenge / Bottleneck:** Configuring Azure File Sync agents, cloud tiering policies, and Recovery Services Vault policies across regions.
* **Valuable Materials:**
  * Azure Storage Explorer tool for hands-on data transfer and access management.

---

## 4. Detailed Exam Practice Question Analysis

The following 6 practice questions reflect the technical scenarios, routing logic, and administrative tasks evaluated on the AZ-104 exam.

---

### Question 1: Networking & VNet Peering Transitivity

**Scenario:**  
An Azure Administrator has three Virtual Networks in the same region: `VNet1`, `VNet2`, and `VNet3`.  
* `VNet1` is peered with `VNet2`.
* `VNet2` is peered with `VNet3`.
* `VNet1` is **not** directly peered with `VNet3`.

A Virtual Machine (`VM1`) on `VNet1` attempts to ping a Virtual Machine (`VM3`) on `VNet3`. What is the default connectivity outcome?

* A) `VM1` can successfully communicate with `VM3` via automatic transit routing in `VNet2`.
* B) `VM1` cannot communicate with `VM3` because VNet Peering is non-transitive.
* C) `VM1` can communicate with `VM3` only if an NSG rule is created on `VNet2`.
* D) Communication succeeds if global VNet Peering is enabled.

**Correct Answer:** **B) `VM1` cannot communicate with `VM3` because VNet Peering is non-transitive.**

**Detailed Explanation:**
* VNet Peering is **non-transitive** by default. Traffic does not automatically hop through intermediate virtual networks unless custom routing (User-Defined Routes and a Virtual Network Appliance or Azure Firewall in `VNet2`) is configured with Gateway Transit enabled.
* Peering `VNet1` to `VNet2` and `VNet2` to `VNet3` does not establish a network path between `VNet1` and `VNet3`.

---

### Question 2: RBAC Role Inheritance & Resource Locks

**Scenario:**  
You have a resource group named `RG-Prod` that contains an Azure SQL Database. 
* User `AdminA` is granted the **Owner** role at the Subscription level.
* A **CanNotDelete** (Read-Only / Delete lock) resource lock is applied directly to `RG-Prod`.

`AdminA` attempts to delete a storage account inside `RG-Prod`. What happens?

* A) The deletion succeeds because `AdminA` holds the Owner role at the Subscription scope.
* B) The deletion fails because the resource lock prevents deletion, regardless of RBAC permissions.
* C) The deletion succeeds if `AdminA` uses Azure CLI with the `--force` flag.
* D) The resource lock is automatically removed when an Owner initiates a deletion request.

**Correct Answer:** **B) The deletion fails because the resource lock prevents deletion, regardless of RBAC permissions.**

**Detailed Explanation:**
* Azure Resource Locks (`CanNotDelete` or `ReadOnly`) apply to all users and roles, regardless of their RBAC privileges—including Subscription Owners.
* To delete the resource, `AdminA` must explicitly remove the resource lock first before executing the deletion action.

---

### Question 3: Azure Storage Replication & Failover

**Scenario:**  
An organization requires a Storage Account configured with Geo-Redundant Storage (GRS) to ensure high availability. The team needs to read stored data from the secondary paired region even when the primary region is operating normally, without initiating an account failover. Which storage redundancy option must be selected?

* A) Locally-Redundant Storage (LRS)
* B) Zone-Redundant Storage (ZRS)
* C) Geo-Redundant Storage (GRS)
* D) Read-Access Geo-Redundant Storage (RA-GRS)

**Correct Answer:** **D) Read-Access Geo-Redundant Storage (RA-GRS)**

**Detailed Explanation:**
* Standard **GRS** replicates data asynchronously to a secondary region, but data in the secondary region is unavailable for read access unless a primary region failover occurs.
* **RA-GRS** provides read-only access to the secondary location data endpoint at all times, making it ideal for high-availability read workloads without requiring manual failover.

---

### Question 4: User-Defined Routing (UDR) Priority

**Scenario:**  
A Virtual Machine (`VM-Web`) resides on Subnet A (`10.0.1.0/24`). Subnet A has a Route Table with the following routes configured:
* Route 1: `10.0.0.0/16` -> Next Hop: `Virtual Network`
* Route 2: `10.0.1.0/24` -> Next Hop: `Virtual Appliance (10.0.2.4)`
* Route 3: `0.0.0.0/0` -> Next Hop: `Internet`

`VM-Web` sends a packet to IP address `10.0.1.50`. Which route will Azure use to forward the packet?

* A) Route 1 (`10.0.0.0/16`)
* B) Route 2 (`10.0.1.0/24`)
* C) Route 3 (`0.0.0.0/0`)
* D) System Default Internet Route

**Correct Answer:** **B) Route 2 (`10.0.1.0/24`)**

**Detailed Explanation:**
* Azure routing evaluates packet destinations using **Longest Prefix Match (LPM)**.
* `/24` is a more specific subnet mask prefix than `/16` or `/0`. Therefore, `10.0.1.0/24` matches `10.0.1.50` most specifically, causing Azure to direct the traffic to the Virtual Appliance (`10.0.2.4`).

---

### Question 5: Azure App Service Auto-Scaling

**Scenario:**  
You manage an Azure App Service plan hosting a critical web application. YouHere is a detailed, professional Markdown guide designed for a GitHub repository. It integrates your Telegraph link naturally as a secondary resource within a comprehensive learning write-up, reducing the risk of being flagged for spam.

```markdown
# Microsoft Azure Administrator (AZ-104) Prep Guide & Practice Notes

Welcome to my preparation guide for the **Microsoft Azure Administrator (AZ-104)** exam. Passing this exam requires a solid balance of theoretical understanding and hands-on operational skill across Azure compute, networking, storage, and identity management.

Below, I have broken down my journey, key phases of preparation, major hurdles, recommended study materials, and a curated set of practice question analyses.

---

## Study Journey & Phase Breakdown

Passing AZ-104 generally requires structured preparation spread across three primary phases:

### Phase 1: Core Fundamentals & Azure Identity
* **Focus:** Azure Active Directory (Microsoft Entra ID), RBAC, subscriptions, governance, and resource management.
* **Key Hurdles:** Distinguishing between Azure RBAC roles and Entra ID directory roles, as well as mastering custom role definitions and administrative units.
* **Hands-on Practice:** Setting up free Azure subscriptions, creating test tenants, user groups, and custom policy definitions.

### Phase 2: Compute & Storage Operations
* **Focus:** Azure Virtual Machines, Virtual Machine Scale Sets (VMSS), App Services, Container Instances (ACI), Azure Kubernetes Service (AKS), and Azure Storage configuration.
* **Key Hurdles:** Configuring storage account access tiers, lifecycle management rules, object replication, and understanding container networking setups.
* **Hands-on Practice:** Deploying multi-tier VM setups, configuring auto-scaling rules, and configuring Blob storage replication across regions.

### Phase 3: Hybrid Networking & Resource Monitoring
* **Focus:** Virtual Networks (VNets), VNet peering, Azure DNS, Network Security Groups (NSGs), User-Defined Routes (UDRs), Load Balancers, Azure Bastion, and Azure Monitor.
* **Key Hurdles
