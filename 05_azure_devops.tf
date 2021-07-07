resource "azuredevops_project" "project" {
  name       = "demo-devops-adf"
  description        = "Project Description"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "repo" {
  project_id = azuredevops_project.project.id
  name       = "Sample Repository"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = "Sample Build Pipeline"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repo.id
    branch_name = azuredevops_git_repository.repo.default_branch
    yml_path    = "azure-pipeline.yaml"
  }

  variable {
    name      = "mypipelinevar"
    value     = "Hello From Az DevOps Pipeline!"
    is_secret = false
  }
}

data "azurerm_subscription" "current" {}

 resource "azuredevops_serviceendpoint_azurerm" "endpointazure" {
  project_id                = azuredevops_project.project.id
  service_endpoint_name     = "test-sc"
  description = "Managed by Terraform" 
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}


