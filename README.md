# AWS Cloud Resume Challenge

A modern, responsive portfolio website built as part of the AWS Cloud Resume Challenge. This project demonstrates cloud engineering skills by deploying a professional resume website using AWS services and Infrastructure as Code (IaC) with Terraform.

**Live Site**: [opubacharles.s3-website-us-east-1.amazonaws.com](http://opubacharles.s3-website-us-east-1.amazonaws.com/)

## Project Overview

This portfolio showcases my journey as a Cloud Support Engineer, featuring:
- AWS Certified Cloud Practitioner certification
- Cloud projects including 3-tier architecture and FastAPI deployments
- Preparation for AWS Solutions Architect Associate and Terraform Associate certifications
- AWS re/Start program graduate experience

## Architecture

### Current Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Developer     │    │    GitHub        │    │   GitHub        │
│   Local Dev     │───▶│   Repository     │───▶│   Actions       │
│                 │    │                  │    │   CI/CD         │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                         │
                                                         │ Deploy
                                                         ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   End Users     │    │      AWS         │    │      AWS        │
│   (Visitors)    │◀───│   S3 Bucket      │◀───│   Credentials   │
│                 │    │  Static Website  │    │   (Secrets)     │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              │ HTTP
                              ▼
                       ┌──────────────────┐
                       │   Website Files  │
                       │   - index.html   │
                       │   - main.css     │
                       │   - app.js       │
                       │   - assets/      │
                       └──────────────────┘
```

### Planned Enhanced Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Developer     │    │    GitHub        │    │   GitHub        │
│   Local Dev     │───▶│   Repository     │───▶│   Actions       │
│                 │    │                  │    │   CI/CD         │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                         │
                                                         │ Deploy
                                                         ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   End Users     │    │   CloudFront     │    │      AWS        │
│   (Global)      │◀───│   CDN + HTTPS    │◀───│   S3 Bucket     │
│                 │    │                  │    │  Static Website │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Custom Domain │    │   SSL/TLS Cert   │    │   Website Files │
│   (Route 53)    │    │   (ACM)          │    │   - index.html  │
│                 │    │                  │    │   - main.css    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

### Infrastructure Components

Current Implementation:
- S3 Bucket: opubacharles - Static website hosting
- Terraform: Infrastructure as Code for provisioning
- GitHub Actions: Automated deployment pipeline
- GitHub Repository: Source code and version control

Planned Enhancements:
- CloudFront: Global CDN for performance and HTTPS
- Route 53: DNS management for custom domain
- ACM: SSL certificate for secure connections
- DynamoDB: Visitor counter (future enhancement)
- Lambda: API for visitor tracking (future enhancement)

## Tech Stack

Frontend:
- HTML5 with semantic structure
- CSS3 with custom properties and responsive design
- Vanilla JavaScript for interactive navigation
- Font Awesome icons

Infrastructure:
- AWS S3 for static website hosting
- Terraform for Infrastructure as Code
- GitHub for version control and CI/CD

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials
- AWS account with S3 permissions

## Quick Start

1. Clone the repository
   ```bash
   git clone https://github.com/Copubah/aws-cloud-resume
   cd aws-cloud-resume
   ```

2. Configure AWS credentials
   ```bash
   aws configure
   ```

3. Deploy infrastructure
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. Access your site
   - Terraform will output the S3 website URL
   - Upload website files to the created S3 bucket

## Project Structure

```
├── main.tf              # Terraform infrastructure configuration
├── variables.tf         # Terraform variables (if needed)
├── outputs.tf          # Terraform outputs
├── website/            # Static website files
│   ├── index.html      # Main portfolio page
│   ├── main.css        # Responsive styling
│   ├── app.js          # Interactive navigation
│   └── assets/         # Images and certificates
└── README.md           # Project documentation
```

## Features

- Responsive Design - Mobile-first approach with smooth animations
- Professional Layout - Clean sections for about, projects, certifications, and contact
- Interactive Navigation - Smooth scrolling with active section highlighting
- Contact Form - Integrated with Formspree for message handling
- Social Links - Direct links to LinkedIn and GitHub profiles

## Infrastructure Details

The Terraform configuration creates:
- S3 bucket with static website hosting enabled
- Bucket policy for public read access
- Proper ownership controls and public access settings

## Data Flow

### Current Flow
1. Developer pushes code to GitHub
2. GitHub Actions triggers on push to master
3. Workflow authenticates with AWS using secrets
4. Files are synced to S3 bucket
5. Users access website via S3 static website endpoint

### Enhanced Flow (Planned)
1. Developer pushes code to GitHub
2. GitHub Actions deploys to S3 and invalidates CloudFront
3. Users access custom domain (Route 53)
4. Route 53 routes to CloudFront distribution
5. CloudFront serves cached content globally with HTTPS
6. CloudFront fetches from S3 origin when needed

## Future Enhancements

- Add CloudFront distribution for HTTPS and global CDN
- Implement custom domain with Route 53
- Add visitor counter with DynamoDB and Lambda
- Set up CI/CD pipeline with GitHub Actions
- Add monitoring with CloudWatch

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/Copubah/aws-cloud-resume/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Charles Opuba - Cloud Support Engineer
- LinkedIn: [charles-opuba-94820574](https://www.linkedin.com/in/charles-opuba-94820574/)
- GitHub: [@Copubah](https://github.com/Copubah)
- Email: Available through the contact form on the website

---

Built with cloud technologies and deployed on AWS