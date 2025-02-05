---
title: Implement Information Protection in Microsoft 365
date: 2025-01-28T18:44:23.059Z
author: Wesley Falize
tags:
  - Information protection
  - Purview
  - Sensitivity label
  - SharePoint
categories:
  - Compliancy
series:
  - Microsoft 365 Compliancy
ShowToc: true
TocOpen: false
draft: true
slug: implement-information-protection-microsoft-365
---

The first part of the journey will be following the 7 modules of [SC-400: Implement Information Protection in Microsoft 365](https://learn.microsoft.com/en-us/training/paths/implement-information-protection/).

These modules are:
* [Introduction to information security and compliance in Microsoft Purview](https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-governance/)
* [Classify data for protection and governance](https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-classify-data/)
* [Create and manage sensitive information types](https://learn.microsoft.com/en-us/training/modules/create-manage-sensitive-information-types/)
* [Understand Microsoft 365 encryption](https://learn.microsoft.com/en-us/training/modules/audit-encryption/)
* [Deploy Microsoft Purview Message Encryption](https://learn.microsoft.com/en-us/training/modules/deploy-message-encryption-microsoft-365/)
* [Create and configure sensitivity labels with Microsoft Purview](https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-protect-information/)
* [Apply sensitivity labels for data protection](https://learn.microsoft.com/en-us/training/modules/apply-manage-sensitivity-labels/)

# Introduction to information security and compliance in Microsoft Purview
* Data will only grow 2016 - 2025 10X increase
* Increase in regulations
* Define a data security strategy
* Protect and govern data wherever it lives![](/images/balance-data-security-productivity.png)
* Information protection involves People, Processes and Technology
  ![](/images/powered-by-intelligent-platform.png)

**Know your data**

* Framework for knowing data
  * Describe categories of sensitive data
  * Discover and classify data
  * View and manage items
* Data classification concepts
  * Sensitive information types (custom & 300 built in)
  * Trainable classifiers (AI training)
  * Exact data Match (Structured data)
* Exploring data
  * Content explorer
  * Activity explorer

**Protect your data**

* Framework for protection
  * Define labels
  * Apply labels
  * Apply labels to the cloud with Defender for cloud apps
  * Scan for on premise files
  * Schematized data in Azure
* A label protects data through Encryption, access control and visual markings
* Emails can be secured with purview message encryption with options for automatic encryption or only for external access.

**Prevent data loss**
![](https://learn.microsoft.com/en-us/training/wwl/m365-compliance-information-governance/media/prevent-data-loss.png)

* Extend this with endpoint DLP

**Govern your data**
* Data lifecycle management
![](https://learn.microsoft.com/en-us/training/wwl/m365-compliance-information-governance/media/govern-your-data-lifecycle.png)
* Records management
![](https://learn.microsoft.com/en-us/training/wwl/m365-compliance-information-governance/media/govern-your-data-records.png)
- Retention labels apply to a specific item, label policies allow publishing of labels and retention policies apply to a workload
- Both lifecycle management and records management are possible
![](https://learn.microsoft.com/en-us/training/wwl/m365-compliance-information-governance/media/govern-your-data.png)
# Classify data for protection and governance
* 5 tools for data classification available (Overview, content explorer, activity explorer, sensitive info types and trainable classifiers)
* Classification happens automatically, and shows top sensitive information types in your organization.
* Classification can happen through three ways:
	* Manually by a user
	* Automated like sensitive information types
	* Through Machine learning
**Sensitive information Types (SIT)**
* Sensitive information types are used in a lot of different places within Microsoft 365 (DLP, Sensitivity labels, Retention labels, Insider risk management, communication compliance, auto labeling and Priva)
* Categories of SIT (Sensitive information Types)
	* Built in SIT
	* Named entity
	* Custom SIT
	* Exact data match (EDM) SIT
* How is a SIT built up?
	* Primary element
		* Regex, keyword list, keyword dictionary or a function
	* Supporting element
		* Regex, keyword list or keyword dictionary
	* Confidence level
	* Proximity
* Custom SIT can be created through UI, EDM and PowerShell
* Trainable classifiers
  * Pre trained classifiers
  * Custom classifiers
    * Configure with seeding the data, testing and publishing the classifier
**Sensitivity labels** {{< tag tag="Sensitivity Labels" >}} {{< tag tag="SharePoint" >}}
