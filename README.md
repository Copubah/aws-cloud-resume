# AWS Cloud Resume Challenge
- This repository contains the code and infrastructure for hosting my personal resume website on AWS using Terraform. The website is built with HTML and CSS and is hosted on Amazon S3. It is served through Amazon CloudFront for improved performance and security. The infrastructure is provisioned as code using Terraform, demonstrating my ability to work with AWS cloud services and Infrastructure as Code (IaC)

## Project Overview
- This project is part of the AWS Cloud Resume Challenge, which demonstrates cloud skills by deploying a simple personal resume website on AWS. The website is designed to showcase my professional experience and skills, with the deployment and infrastructure entirely managed through Terraform.

 ## Infrastructure includes:
- S3 Bucket: Used to host the static website.
- CloudFront: A Content Delivery Network (CDN) for improved global performance and secure HTTPS delivery.
- Route 53 (optional): For managing DNS and pointing a custom domain to CloudFront


## Requirements
1. Terraform: To provision the infrastructure.
2. AWS Account: To deploy the infrastructure on AWS.
3. Domain Name (optional): A custom domain name to point to the CloudFront distribution.
4. AWS Certificate Manager (ACM): To issue an SSL certificate for HTTPS.

## Setup Instructions
1. Clone the Repository
 - git clone https://github.com/Copubah/aws-cloud-resume
 - cd aws-cloud-resume

2. Install Terraform
- If you don’t have Terraform installed, follow the instructions from the Terraform official website to install it on your machine.

3. Configure AWS CLI
- Ensure that the AWS CLI is configured with the appropriate credentials. If you haven’t already, run the following command and follow the instructions:
  - aws configure

4. Initialize Terraform
- Initialize Terraform to download the necessary providers and dependencies
 - terraform init

5. Plan the Deployment
- Terraform will show a plan of what resources it intends to create. Review this plan to ensure everything is correct:
 - terraform plan


6. Apply the Configuration
- Apply the Terraform configuration to create the resources in AWS:
  - terraform apply

7. Access Your Resume Website
Once the deployment is complete, Terraform will output the URL of the website. You can access your resume website using the provided CloudFront URL.
If you configured a custom domain and Route 53, your website will be accessible at that domain (e.g., www.charlesopuba.com).

## Structure of the Project
1. main.tf
This is the main Terraform configuration file. It defines all AWS resources like the S3 bucket for hosting the website, the CloudFront distribution for CDN, and the Route 53 DNS record for domain management.

2. variables.tf
This file contains the variables used in the Terraform configuration, such as the AWS region, S3 bucket name, domain name, and ACM certificate ARN.

3. outputs.tf
This file outputs useful information, such as the CloudFront distribution URL, after Terraform has applied the changes.

4. website/
This folder contains the static website files:

index.html: The main HTML file for the resume.

style.css: Basic CSS for styling the website.

app.js :For the logic

5. README.md
This file provides instructions on setting up the project, deploying the infrastructure, and accessing the resume website.

## Additional Notes
- HTTPS: If you are using a custom domain, ensure you have an SSL certificate for the domain in AWS Certificate Manager. The acm_certificate_arn must point to that certificate in the variables.tf file.

- Route 53: If you're using Route 53 for DNS, make sure you have set up a hosted zone and the appropriate record.

- S3 Public Access: Ensure that the S3 bucket's permissions are set to allow public access to the files.

## Contributing
Feel free to fork the repository, submit issues, or create pull requests. Contributions and suggestions are welcome!

## License
This project is licensed under the MIT License – see the LICENSE file for details.


# Triggering first workflow run
