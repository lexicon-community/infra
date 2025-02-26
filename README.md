# Infra

This repository contains configuration and tooling for lexicon.community infrastructure.

1. Create DNS records used to discover lexicon schema records
2. Populate lexicon schema records with lexicon definitions found in the [lexicon-community/lexicon](https://github.com/lexicon-community/lexicon) repository.

# Usage

## DNS

This uses opentofu (a Terraform fork) to create and update DNS infrastructure.

1. Set your provider configuration.
   
   `export DNSIMPLE_TOKEN=dnsimple_a_decafbad`

2. Verify the planned updates from infrastructure configuration changes.
   
   `tofu plan`

3. Apply the updates.
   
   `tofu apply`

## PDS

Once DNS entries are created, the lexicon schema records must be populated.

1. Populate the records.
   
   `./populate.sh ../lexicon`