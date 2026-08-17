# Azure Security Architecture & Zero Trust Implementation Notes

Establishing a resilient cloud security posture in Microsoft Azure requires implementing a comprehensive **Zero Trust model** (*Explicitly verify, Use least privileged access, Assume breach*). The AZ-500 domain focuses on operationalizing security controls across identity, network infrastructure, host platforms, data storage, and centralized security operations.

> **Key Takeaway:** In cloud security, identity is the primary control plane. Transitioning from perimeter-based security to data-centric and identity-centric security ensures defense-in-depth against advanced threats.

## 1. Identity & Zero Trust Architecture

Modern cloud security shifts away from trusted internal networks toward continuous verification of every access request:

* **Conditional Access:** Evaluates signals (user context, device health, IP location, application sensitivity) in real time to enforce policy decisions (Block, Require MFA, or Limit Session).
* **Privileged Identity Management (PIM):** Enforces Just-In-Time (JIT) access for high-privilege roles (e.g., Global Administrator, Owner). It prevents standing admin privileges by requiring time-bound activations, MFA, and manager approval.
* **Microsoft Entra Protection:** Leverages machine learning to detect risk events (e.g., impossible travel, leaked credentials) and automatically triggers self-service remediation or access blocking.

## 2. Network Isolation & Micro-Segmentation

Securing virtual networks requires layering boundary controls to prevent lateral threat movement:

* **NSGs vs. ASGs:** Network Security Groups (NSGs) filter layer 3/4 traffic using IP ranges and ports. Application Security Groups (ASGs) allow grouping Virtual Machines logically by workload function, simplifying firewall rule creation without hardcoding IP addresses.
* **Private Endpoints vs. Service Endpoints:** Service Endpoints route traffic securely over the Microsoft backbone but retain public IP exposure. Private Endpoints assign a private IP directly from your VNet (via Private Link), removing public internet exposure entirely.
* **Azure Firewall & WAF:** Azure Firewall provides stateful layer 7 network inspection across VNets. Web Application Firewall (WAF) inspects HTTP/HTTPS traffic at the edge to block OWASP Top 10 vulnerabilities.

## 3. Key Vault & Data Protection Standards

Protecting data at rest and in transit relies on key management, granular access policies, and storage account safeguards:

* **Azure Key Vault Access Models:** Access can be controlled using legacy Key Vault Access Policies or modern Azure RBAC (`Key Vault Secrets User`, `Key Vault Crypto Officer`). RBAC provides finer-grained scope isolation at individual secret or key levels.
* **Customer-Managed Keys (CMK):** Allows organizations to bring their own encryption keys to encrypt storage accounts and databases, ensuring full control over key rotation and revocation.
* **Storage Access Control:** Avoid using raw Account Access Keys in code. Instead, issue short-lived **Service SAS (Shared Access Signatures)** bound to **Stored Access Policies** to allow instant access revocation.

## 4. Threat Protection & Centralized SecOps

Maintaining continuous visibility and threat response across subscriptions requires unified security management:

* **Microsoft Defender for Cloud:** Provides Cloud Security Posture Management (CSPM) via Secure Score recommendations and Cloud Workload Protection (CWP) to safeguard VMs, containers, and database engines against active attacks.
* **Microsoft Sentinel (SIEM/SOAR):** Collects log data across cloud and on-premises environments into a centralized Log Analytics Workspace.
* **Kusto Query Language (KQL):** The core query engine used in Sentinel to parse security event logs, construct custom correlation analytics rules, and trigger automated Logic App playbooks.

## 5. Security Governance & Policy Enforcement

> Automated compliance controls prevent unauthorized infrastructure drift before resources are deployed.

* **Azure Policy (Deny Effect):** Enforces strict compliance boundaries (e.g., automatically blocking the deployment of unencrypted storage accounts or VMs with public IPs).
* **Resource Locks (`ReadOnly` / `CanNotDelete`):** Prevents operational mishaps by stopping administrators from deleting critical baseline security services.
