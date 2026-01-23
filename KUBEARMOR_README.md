# PS3 – KubeArmor Zero-Trust Policy

This document describes the optional PS3 task for the AccuKnox DevOps Trainee assessment.

## Objective
The objective of this task is to demonstrate zero-trust security principles by defining a KubeArmor policy for the Wisecow Kubernetes workload.

## Policy Overview
- **Policy Name:** wisecow-zero-trust
- **Namespace:** default
- **Target Pods:** Pods with label `app=wisecow`
- **Restricted Processes:**
  - /bin/sh
  - /bin/bash
- **Action:** Block

The policy prevents unauthorized shell access inside the application container, reducing the attack surface and following runtime security best practices.


