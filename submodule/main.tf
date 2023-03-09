resource "random_pet" "example" {
  keepers = {
    string  = var.string
  }
}

variable "string" {
  default   = "qwerty"
  type = string
}

resource "random_pet" "top_level" {
  keepers = {
    # Generate a new pet name each time
    time = timestamp()
  } 
}

output "top_level_pet" {
  value = resource.random_pet.top_level.id
}

output "keeper" {
  value = resource.random_pet.example.keepers.string
}

module "submodule" {
  source = "./terraform-scalr-flat"
}
