# Setup for accessing identity tokens

See internal documents for this - I won't post too much publicly ;)
This repo is for use alongside a fork of https://github.com/liamcervante/capture-stacks-jwt

The Terraform config is a lightly adapted version of https://github.com/alexsomesan/gke-deferred-stack- thank you Alex!

The config will create everything necessary for getting an identity token:

GCP resources (oidc.tf):
    - A service account
    - A Workload Identity Pool
    - An identity provider in that pool
        - Including a lot of important configuration options that are coupled to contents of https://github.com/liamcervante/capture-stacks-jwt
    - Permissions necessary for that workload identity pool to enable impersonation of the service account via WIF
    - Permissions for the service account to be able to provision things in the project once it's successfully impersonated by the Google provider

TFE resources (hcp-stack.tf):
    - A stack in a preexisting org and project
    - Connects the Stack to your fork of https://github.com/liamcervante/capture-stacks-jwt so it automatically detects pushes


## ENVs needed

Use ENVs to supply TF vars needed:

```
export TF_VAR_tfc_organization_name=<your org name>
export TF_VAR_tfc_project_name=<your project name (stacks enabled)>
export TF_VAR_github_token=$(gh auth token)
export TF_VAR_github_repo_identifier=<your github name>/capture-stacks-jwt
```

Create an organization API token in TFC at https://app.terraform.io/app/<org>/settings/authentication-tokens

```
export TFC_TOKEN=<token>
```

You will also need ENVs to configure the Google provider:

```
export GOOGLE_CREDENTIALS=<path or content of service account key file in JSON format>
export GOOGLE_PROJECT=<project id of existing project>
```

## Outputs

The `gcp_service_account_email` and `gcp_audience` outputs from the setup config are needed when testing the new Google provider auth method that uses OIDC.