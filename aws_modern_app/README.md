### This folder contains a modern applictaion reference architecture in AWS.
-----

#### Introduction
-----
I get the inspiration by F5 Nginx's [MARA project](https://github.com/nginxinc/kic-reference-architectures). In this project, there are some points very make sense.

A modern app should be driven by at least four characteristics: scalability, portability, resiliency, and agility.

In AWS, we use `ASG + CloudWatch` or `EKS HPA` for scalability, use `multi-az` or `cross-region` for resiliency, use `cloudformation` or `terraform` for IaC, also with automated CI/CD pipelines, we can even build an app many times a day. With the philosophy of `everything as code`, we can easily make the app portable, just run these code in another AWS region, etc.


#### How to
-----
#### IaC
First step is to do IaC, if your company has multi-cloud, AWS, Alicloud, Azure, GCP, etc. `Terraform` is a good choice, `pulumi` is also good, but may not that mature now.

I have done an example in this folder with terraform(.tf files).

Second step is to use `CasC` like `Ansible` or `Puppet`.

1. Modify the `terraform.tfvars` file according to your AWS VPC settings.
2. Run `terraform init`, `terraform plan` and `terraform apply` to apply these AWS infrastructures.

#### CI/CD
The real application code is sitting in [python_demo_app](https://github.com/dhutsj/python_demo). I have pushed the image to dockerhub.

For CI, you can use CI tools like `Jenkins`/`GitHub Action` to build the source code into a docker image.

For CD, you can still use `Jenkins`/`GitHub Action` or `ArgoCD` if you implement `GitOps`.

There is no right or wrong which tool you use, just choose the one most situable for you.
