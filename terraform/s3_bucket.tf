resource "aws_s3_bucket" "kubernetes_cluster_bucket" {
  bucket  = "kubernetes-cluster-bucket-001"
  tags    = {
	Name          = "k8s-storage"
  }
}