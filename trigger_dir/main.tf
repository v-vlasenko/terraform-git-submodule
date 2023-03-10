resource "random_pet" "trigger" {
  keepers = {
    timestamp = timestamp()
  }
}
