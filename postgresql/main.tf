provider "kubernetes" {
  config_path = "~/.kube/config/"
}
resource "kubernetes_manifest" "postgresql_service" {
  manifest = yamldecode(file("${path.module}/postgresql-service.yaml"))
}
resource "kubernetes_manifest" "postgresql_deployment" {
  manifest = yamldecode(file("${path.module}/postgresql-deployment.yaml"))
}
output "postgres_service_endpoint" {
  value = "postgresql.default.svc.cluster.local"
}
output "postgres_service_port" {
  value = 5432
}
  
