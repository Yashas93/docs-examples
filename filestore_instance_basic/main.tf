resource "google_filestore_instance" "instance" {
  provider = "google-beta"

  name = "test-instance-${local.name_suffix}"
  zone = "us-central1-b"
  tier = "PREMIUM"

  file_shares {
    capacity_gb = 2660
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}

provider "google-beta"{
  region = "us-central1"
  zone   = "us-central1-a"
}
