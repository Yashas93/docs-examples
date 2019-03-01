resource "google_pubsub_topic" "topic" {
  provider = "google-beta"

  name = "job-topic-${local.name_suffix}"
}

resource "google_cloud_scheduler_job" "job" {
  provider = "google-beta"

  name     = "test-job-${local.name_suffix}"
  description = "test job"
  schedule = "*/2 * * * *"

  pubsub_target {
    topic_name = "${google_pubsub_topic.topic.id}"
    data = "${base64encode("test")}"
  }
}

provider "google-beta"{
  region = "us-central1"
  zone   = "us-central1-a"
}
