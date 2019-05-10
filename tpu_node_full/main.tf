resource "google_compute_network" "tpu_network" {
	name               = "test-tpu-network-${local.name_suffix}"
	auto_create_subnetworks = false
}

data "google_tpu_tensorflow_versions" "available" { }

resource "google_tpu_node" "tpu" {
	name               = "test-tpu-${local.name_suffix}"
	zone               = "us-central1-b"

	accelerator_type   = "v3-8"

	cidr_block         = "10.3.0.0/29"
	tensorflow_version = "${data.google_tpu_tensorflow_versions.available.versions[0]}"

	description = "Terraform Google Provider test TPU"
	network = "${google_compute_network.tpu_network.name}"

	labels = {
		foo = "bar"
	}

	scheduling_config {
		preemptible = true
	}
}
