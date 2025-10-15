output "ip_servers" {
    description = "IPs servidores desplegados"
    value = module.vm.ip_servers
}

output "resource_group_name" {
    description = "Nombre grupo de recursos"
    value = azurerm_resource_group.main.name
}

output "jenkins_url" {
    description = "URL de Jenkins"
    value = "http://${[for server in module.vm.ip_servers : server.ip if can(regex("jenkins", server.name))][0]}:8080"
}

output "nginx_url" {
    description = "URL de Nginx"
    value = "http://${[for server in module.vm.ip_servers : server.ip if can(regex("nginx", server.name))][0]}"
}

output "sonarqube_url" {
    description = "URL de SonarQube"
    value = "http://${[for server in module.vm.ip_servers : server.ip if can(regex("jenkins", server.name))][0]}:9000"
}