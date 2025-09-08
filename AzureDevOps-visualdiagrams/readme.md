## Azure DevOps Automation visual diagrams 

# End-to-End Platform Overview

flowchart LR
  subgraph Dev[Developers]
    A[App Source Code\n(Services, Helm charts)]
    I[Infra as Code\n(Terraform modules)]
  end

  subgraph ADO[Azure DevOps]
    B[CI Pipeline\nBuild+Test+Scan]
    C[Container Build\nImage -> ACR]
    D[Artifact/Chart Publish]
    E[GitOps Bump\n(PR to GitOps repo)]
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
    M[Argo CD\nApp-of-Apps]
  end

  L --> M
  M -->|Sync| G
  G -->|Telemetry| H
  G -->|Pull| F
  G -->|Secrets CSI| J
  K -->|Ingress| G
  
