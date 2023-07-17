variable "location_map" {
  type = map(string)

  default = {
    australiacentral          = "acaus"
    australiacentral2         = "acaus2"
    australiaeast             = "aeaus"
    australiasoutheast        = "asaus"
    brazilsouth               = "bsbra"
    brazilsoutheast           = "besbra"
    brazilus                  = "bus"
    canadacentral             = "ccan"
    canadaeast                = "ecan"
    centralindia              = "cin"
    centralus                 = "cus"
    centraluseuap             = "ceusap"
    eastasia                  = "eas"
    eastus                    = "eus"
    eastus2                   = "eus2"
    eastus2euap               = "e2usap"
    francecentral             = "cfr"
    francesouth               = "sfr"
    germanynorth              = "ngwe"
    germanywestcentral        = "cgwe"
    israelcentral             = "icisr"
    italynorth                = "nin"
    japaneast                 = "jea"
    japanwest                 = "jwe"
    jioindiacentral           = "jicin"
    jioindiawest              = "jiwin"
    koreacentral              = "ckor"
    koreasouth                = "skor"
    malaysiasouth             = "smy"
    northcentralus            = "ncus"
    northeurope               = "neu"
    norwayeast                = "enor"
    norwaywest                = "wnor"
    polandcentral             = "cpol"
    qatarcentral              = "cqat"
    southafricanorth          = "nsafr"
    southafricawest           = "wsafr"
    southcentralus            = "scus"
    southeastasia             = "seas"
    southindia                = "sin"
    swedencentral             = "cswd"
    swedensouth               = "sswd"
    switzerlandnorth          = "nswi"
    switzerlandwest           = "wswi"
    uaecentral                = "cuae"
    uaenorth                  = "nuad"
    uksouth                   = "suk"
    ukwest                    = "wuk"
    westcentralus             = "wcus"
    westeurope                = "weu"
    westindia                 = "win"
    westus                    = "wus"
    westus2                   = "wus2"
    westus3                   = "wus3"
    austriaeast               = "aeau"
    chilecentral              = "cchil"
    eastusslv                 = "euslv"
    israelnorthwest           = "nwisr"
    malaysiawest              = "wmy"
    mexicocentral             = "cmex"
    newzealandnorth           = "nzn"
    southeastasiafoundational = "seasf"
    spaincentral              = "cspn"
    taiwannorth               = "ntai"
    taiwannorthwest           = "nwtai"
  }
}

variable "suffix" {
  type    = string
  default = "tfstate"
}

variable "prefix" {
  description = "Prefix for the resources, e.g 'w365'"
  type        = string
  default     = "w365"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "prod"
}
