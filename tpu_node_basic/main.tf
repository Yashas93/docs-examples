resource "google_tpu_node" "tpu" {
	name           = "test-tpu-${local.name_suffix}"
	zone           = "us-central1-b"

	accelerator_type   = "v3-8"
	tensorflow_version = "1.9"
	cidr_block         = "10.2.0.0/29"
}
