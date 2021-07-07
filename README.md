# Introduction 

This repo is intended to be used as a demo template on using azure devops in
combination with Azure Data Factory in a DTAP fashion.

For the demonstration one would show how updating the dev data factory would
propagate to production using artifacts and the release pipeline.
To this end a source/sink container is made in the blob storage 
and one can implement a simple copy statement to show how it works. 

The Terraform templates provision the following resources.
 - Three resource groups, the dev test and prod environments
 - One management resource group containing the Key Vaults.
 - A Data Factory in each resource group 
 - A Storage Account in each resource group.
 	- Two containers containing some dummy data.
 - A Azure DevOps project and repository for the ADF templates

This mimic's the separated environments found in DTAP streets. 
After provisioning the resources Terraform applies the following 
configurations for each of the resources.
 - Key Vault. 
 	- Configures the access policies so that only the right ADF has access
	  to the key vault.
	- It retrieves the connection strings for the storage accounts and
	  stores them in the corresponding key vault.
 - Storage Account
 	- Creates two containers, the source and sink.
	- Uploads a dataset to the source container. 
 - Azure DevOps 
 	- Creates a DevOps project.
	- Initializes an empty repo
	- Initializes an empty build pipeline 
	- Creates a service connection to azure. 

It can be readily observed that some steps are still missing and this is due to 
limitations in both the Terraform resource providers and the Azure DevOps CLI
commands lacking the required commands. 

Most notably:
 - The Data Factory in Dev can not be hooked automatically to the Azure DevOps
   repo.
 - The release pipeline can not be provisioned using code. 
 - The Linked services in Azure DevOps can not be provisioned using Terraform in
   the connection strings are to be retrieved from Key Vault. 

In light of the above some manual steps have to be configured by hand.
See instructions below. 

# Usage 

 1) First clone the repository to your local machine and make sure to have the
 Azure CLI and terraform configured.
 2) Create a PAT Token for Azure DevOps and fetch the url for your organization
 and export those using the following (linux) commands. 
 ```{shell} 
  export AZDO_PERSONAL_ACCESS_TOKEN="" 
  export AZDO_ORG_SERVICE_URL=""
 
 ```
 3) Review the variables in the `variables.tf` file. The Storage account names
 should be globally unique. 
 
 4) Run the commands 
 ```{shell} 
  az login
  terraform init 
  terraform plan 
  terraform apply
 ```
 The first command makes sure the azure cli is authorized. 

 5) Open the Data Factory in the dev resource group and connect it with the
 provisioned Azure DevOps Repository.
 Now create the following.
 	- Create the linked service to the blob storage using the Key Vault to
	  retrieve the connection string. The secret is called `storage-cs`
	- Create two datasets using the uploaded file 
	- Create a pipeline that copies the file from source to sink. 
 Make sure that the ARM templates get uploaded to Azure DevOps 
 6) Create a Release Pipeline.
 	- As an artifact select the adf\_publish branch. 
	- Create a test stage with a "ARM Template Deployment" task
	- Change the parameters to point to the right resources in test instead
	  of dev.
	- Repeat these steps for the prod env. 
 7) Configure devops to automatically trigger on updates to the master branch.
    Run the release pipeline to make sure everything works. 

