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

output "keeper" {
  value = resource.random_pet.example.keepers
}

output "top_level_pet" {
  value = resource.random_pet.top_level.id
}

module "submodule" {
  source = "./terraform-scalr-flat"
}
