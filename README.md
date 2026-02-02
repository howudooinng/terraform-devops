flowchart LR
    Dev[Developer Laptop] -->|terraform apply| TF[Terraform CLI]
    TF -->|AWS Provider| AWS[AWS Account]
    AWS --> EC2[EC2 Instance]
    EC2 -->|user-data| NGINX[NGINX Web Server]
    Dev -->|SSH| EC2
    Dev -->|HTTP| NGINX
