output "dn" {
  value       = aci_rest.infraAccPortP.id
  description = "Distinguished name of `infraAccPortP` object."
}

output "name" {
  value       = aci_rest.infraAccPortP.content.name
  description = "Leaf interface profile name."
}
