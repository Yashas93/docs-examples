resource "google_cloud_scheduler_job" "job" {
  provider = "google-beta"

  name     = "test-job-${local.name_suffix}"
  description = "test http job"
  schedule = "*/8 * * * *"
  time_zone = "America/New_York"

  http_target {
    http_method = "POST"
    uri = "https://example.com/ping"
  }
}

provider "google-beta"{
  region = "us-central1"
  zone   = "us-central1-a"
}
