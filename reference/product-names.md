# Red Hat Product Names Reference

This is a reference for correct Red Hat product names and common mistakes. On first use in any document, always use the full official name. After that, the short name or abbreviation is acceptable.

## Core Platforms

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Enterprise Linux (RHEL) | RHEL (after first use) | Redhat Linux, Red Hat Linux, RHEL (on first use) |
| Red Hat OpenShift Container Platform | OpenShift | Openshift, Open Shift, openshift, OCP (on first use) |
| Red Hat OpenShift AI | OpenShift AI (after first use) | Openshift AI, OpenShift AI (without "Red Hat" on first use) |
| Red Hat Ansible Automation Platform | Ansible Automation Platform (after first use) | Ansible (on first use), AAP (on first use), Ansible Tower (deprecated) |
| Red Hat OpenStack Platform | OpenStack Platform (after first use) | Openstack, Red Hat Openstack, OpenStack (without Platform) |

## Cloud Services

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat OpenShift Service on AWS (ROSA) | ROSA (after first use) | ROSA (on first use), Rosa |
| Azure Red Hat OpenShift (ARO) | ARO (after first use) | ARO (on first use), Azure Openshift |
| Red Hat OpenShift Dedicated | OpenShift Dedicated (after first use) | Openshift Dedicated |
| Red Hat OpenShift on IBM Cloud | OpenShift on IBM Cloud (after first use) | Openshift on IBM |

## Management and Automation

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Advanced Cluster Management for Kubernetes | ACM (after first use) | ACM (on first use), RHACM, Advanced Cluster Management (without "Red Hat" on first use) |
| Red Hat Satellite | Satellite (after first use) | Red Hat Sattelite, RH Satellite |
| Red Hat Insights | Insights (after first use) | RH Insights |
| Red Hat Smart Management | Smart Management (after first use) | SmartManagement |

## Developer Tools

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Developer Hub | Developer Hub (after first use) | Developer hub, DevHub, Red Hat Dev Hub, RHDH (on first use) |
| Red Hat CodeReady Workspaces | CodeReady Workspaces (after first use) | Codeready, Code Ready |
| Red Hat Trusted Software Supply Chain | Trusted Software Supply Chain (after first use) | RHTSSC, Trusted Supply Chain (without "Software") |

## Storage and Data

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Ceph Storage | Ceph Storage (after first use) | Ceph (on first use), Red Hat Ceph |
| Red Hat OpenShift Data Foundation | ODF (after first use) | ODF (on first use), OpenShift Data Foundation (without "Red Hat" on first use) |
| Red Hat Data Grid | Data Grid (after first use) | Datagrid, DataGrid |

## Middleware and Runtimes

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat JBoss Enterprise Application Platform | JBoss EAP (after first use) | JBoss, JBOSS, jboss |
| Red Hat build of Quarkus | Quarkus (after first use) | Red Hat Quarkus, RH Quarkus |
| Red Hat build of Keycloak | Keycloak (after first use) | Red Hat Keycloak, RH Keycloak, Keylock |
| Red Hat Application Foundations | App Foundations (after first use) | Red Hat App Foundations |

## AI and Machine Learning

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat OpenShift AI | OpenShift AI (after first use) | RHOAI, Openshift AI, OpenShift AI (without "Red Hat" on first use) |
| InstructLab | InstructLab | Instruct Lab, instructlab, InstructLAB, Instructlab, instruct lab |
| llm-d | llm-d | LLM-D, Llm-d, LLMD, llmd |
| Red Hat Enterprise Linux AI (RHEL AI) | RHEL AI (after first use) | RHELAI, Rhel AI |
| vLLM | vLLM | VLLM, Vllm, vllm (in prose) |

## Container Tools

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Quay | Quay (after first use) | Quay (on first use without "Red Hat"), quay.io (when referring to the product) |
| Podman | Podman | PodMan, podMan, podman (at sentence start) |
| Buildah | Buildah | buildah (at sentence start), BuildAh |
| Skopeo | Skopeo | skopeo (at sentence start) |

## Security

| Official Name | Acceptable Short Name | Common Mistakes |
|---|---|---|
| Red Hat Advanced Cluster Security for Kubernetes | ACS (after first use) | ACS (on first use), RHACS, StackRox |
| Red Hat Trusted Profile Analyzer | TPA (after first use) | Trusted Profile Analyzer (without "Red Hat" on first use) |
| Red Hat Trusted Application Pipeline | TAP (after first use) | Trusted Application Pipeline (without "Red Hat" on first use) |

## Partner and Ecosystem Product Names

These are not Red Hat products, but they frequently appear in Red Hat content and are often misspelled or miscapitalized.

| Official Name | Common Mistakes |
|---|---|
| Kubernetes | kubernetes (in prose), K8s (in formal writing), Kuberentes, Kubernets |
| NVIDIA | Nvidia, nvidia (in prose), NVidia |
| NVIDIA GPU Operator | Nvidia GPU Operator, nvidia gpu operator |
| NVIDIA NIM | Nvidia NIM, nvidia nim |
| Intel | intel (in prose) |
| AMD | Amd, amd (in prose) |
| AWS | aws (in prose), Amazon Web Services (after first use in technical content) |
| Microsoft Azure | Azure (acceptable after first use), azure (in prose) |
| Google Cloud | GCP (acceptable after first use), google cloud |
| VMware | Vmware, VMWare, vmware |
| Prometheus | prometheus (in prose) |
| Grafana | grafana (in prose) |
| Terraform | terraform (in prose), Terraform (when referring to IBM-acquired product, use OpenTofu for open source references where appropriate) |
| Apache Kafka | Kafka (acceptable after first use), kafka (in prose) |

## General Rules

1. **First use**: Always spell out the full official product name on first use in a document. Include the abbreviation in parentheses if you plan to use it later.
2. **"Red Hat" prefix**: Most products require "Red Hat" on first use. After that, you can drop it.
3. **Capitalization**: Match the official capitalization exactly. "OpenShift" has a capital S. "OpenStack" has a capital S. "InstructLab" has a capital I and capital L.
4. **No "RH" abbreviation**: Never abbreviate "Red Hat" to "RH" in external-facing content.
5. **Deprecated names**: Do not use deprecated product names (e.g., "Ansible Tower" is now part of "Red Hat Ansible Automation Platform").
6. **Community vs. product**: Distinguish between community projects (Kubernetes, Ansible) and Red Hat products (Red Hat OpenShift Container Platform, Red Hat Ansible Automation Platform).
7. **Partner names matter**: Getting a partner's product name wrong is just as embarrassing as getting your own wrong. Always verify capitalization for NVIDIA, VMware, and other partner names.
8. **Tool names in prose vs. code**: Tool names like Podman, Buildah, and Skopeo are capitalized in prose but lowercase in commands and code examples (e.g., "Run Podman" in prose, `podman run` in code).
