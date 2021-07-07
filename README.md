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
 2) 


