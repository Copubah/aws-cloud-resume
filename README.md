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

Current Infrastructure:
- S3 Static Website Hosting - Hosts the portfolio files with public read access
- Terraform IaC - Automated infrastructure provisioning and management

Planned Enhancements:
- CloudFront CDN for global performance and HTTPS
- Route 53 for custom domain management
- AWS Certificate Manager for SSL certificates

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

## Future Enhancements

- [ ] Add CloudFront distribution for HTTPS and global CDN
- [ ] Implement custom domain with Route 53
- [ ] Add visitor counter with DynamoDB and Lambda
- [ ] Set up CI/CD pipeline with GitHub Actions
- [ ] Add monitoring with CloudWatch

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