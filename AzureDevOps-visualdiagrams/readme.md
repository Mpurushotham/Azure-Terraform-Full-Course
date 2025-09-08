## Azure DevOps Automation visual diagrams 

# End-to-End Platform Overview

Shows how code flows from Dev → ADO → ACR/GitOps → Argo CD → AKS, with observability and security controls.


```mermaid
flowchart LR
  subgraph Dev[Developers]
    A[App Source Code(Services, Helm charts)]
    I[Infra as Code(Terraform modules)]
  end

  subgraph ADO[Azure DevOps]
    B[CI Pipeline Build+Test+Scan]
    C[Container Build Image -> ACR]
    D[Artifact/Chart Publish]
    E[GitOps Bump (PR to GitOps repo)]
  end

  A --> B --> C --> D --> E
  I -->|Plan/Apply| ADO

  subgraph Azure[Azure]
    F[Azure Container Registry (ACR)]
    G[(AKS Cluster)]
    H[Log Analytics / Monitor]
    J[Key Vault]
    K[App Gateway/WAF]
  end

  C --> F
  E -->|Desired State| L[GitOps Repo]

  subgraph Cluster[Cluster Control]
    M[Argo CD App-of-Apps]
  end

  L --> M
  M -->|Sync| G
  G -->|Telemetry| H
  G -->|Pull| F
  G -->|Secrets CSI| J
  K -->|Ingress| G
```



```
