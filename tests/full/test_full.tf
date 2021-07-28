terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "INT-PROF1"
}

data "aci_rest" "infraAccPortP" {
  dn = "uni/infra/accportprof-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "infraAccPortP" {
  component = "infraAccPortP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.infraAccPortP.content.name
    want        = module.main.name
  }
}
