# Mohammed Hossam — Developer Portfolio

A modern, responsive personal portfolio website built with **Next.js, TypeScript, and Tailwind CSS**.

### [my portfolio](https://staging.d3aadsli5ixben.amplifyapp.com/)

## Features

web app

- CV/resume page
- Reusable React components
- Centralized portfolio data
- Suitable for deployment on Amazon S3

terraform architecture

- creation of full infrastructure (S3 , IAM)
- Automatic storage of the AWS api key along with the github PAT to store the key and check thier existance
- state file storage on a protected `terraform` folder on the S3 bucket

## Technology Stack

| Technology   | Purpose                                    |
| ------------ | ------------------------------------------ | --- |
| Next.js      | React framework and static site generation |
| React        | UI components                              |
| TypeScript   | Type-safe development                      |
| Tailwind CSS | Styling and responsive design              |     |
| Amazon S3    | Static website hosting                     |
| GitHub       | Source code management                     |

## to reuse the terraform achticture

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
```

Move to terrafrom directory:

```bash
cd terraform
```

### 2. before running

1. change the `variables.tf` to match your info
2. move the backed.tf file out the project or change its extension like `backend.tf.lala` for now thats beacuse the s3 bucket where the statefile will be stored is going to be created in the first terrafrom run
3. initiate the terminal session with the the aws and github api keys as environment variables

### 3. infrastructure provision

run the following commands in your initiated session

```bash
terraform init \
terrafrom plan \
terraform apply
```

### 4. after running

revoke the backend.tf file again as it was then run the command

```bash
  terraform init -migrate-state
```

this will store the current state of the infrastructre in the created S3 Bucket as `.tfstate` file

and **voilla**
