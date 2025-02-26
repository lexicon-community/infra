variable "account-did" {
  type      = string
  default = "did:plc:2uwoih2htodskvgocarwv5eq"
}

variable "bare-domain" {
  type      = string
  default = "lexicon.community"
}

resource "dnsimple_zone" "lexicon-community" {
  name = "${var.bare-domain}"
}

resource "dnsimple_zone_record" "atproto-handle" {
  zone_name = "${dnsimple_zone.lexicon-community.name}"
  name   = "_atproto"
  value  = "\"did=${var.account-did}\""
  type   = "TXT"
  ttl    = 86400
}


locals {
    nsids = ["bookmarks", "calendar", "location"]
}

resource "dnsimple_zone_record" "nsid" {
  for_each = toset(local.nsids)
  zone_name = "${dnsimple_zone.lexicon-community.name}"
  name   = "_lexicon.${each.key}"
  value  = "\"did=${var.account-did}\""
  type   = "TXT"
  ttl    = 86400
}
