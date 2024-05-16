# output "azs" {
#   value = data.aws_availability_zones.available.names
# }

# output "az_names" {
#   value = local.az_names
  
# }

output "azs" {
  value=data.aws_availability_zones.available.names
}