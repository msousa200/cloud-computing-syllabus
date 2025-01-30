variable "enviroment" {
    type = list(string)
    default = [ "dev","beta","prod" ]
    description = "Enviroment (aka k8s namespace)"

    #validation {
      #condition = contains(["dev", "qa", "prod"])
       # error_message = "Invalid enviroment"
    #}
}