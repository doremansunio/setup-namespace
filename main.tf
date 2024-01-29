terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
  }
}

provider "rafay" {
  # provider_config_file = "./rafay_config.json"
}

#Basic example for namespace
resource "rafay_namespace" "tfdemonamespace" {
  metadata {
    name    = var.namespace_name
    project = var.project_name
  }
  spec {
    drift {
      enabled = false
    }
    placement {
      labels {
        key   = "rafay.dev/clusterName"
        value = var.cluster_name
      }
    }
  }
}