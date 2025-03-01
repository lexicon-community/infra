# Goat Setup

This project uses the `goat` command line interface application to validate and publish lexicon records.

https://github.com/bluesky-social/indigo/tree/main/cmd/goat

## Installation

At this time, installing goat requires the Golang build tools.

    $ go install github.com/bluesky-social/indigo/cmd/goat@latest

Once goat is installed, verify the integrity of the application on your platform:

    $ goat -v
    goat version v0.0.0-20250225075145-464ab8d6b5a0

## Initilization

First, view the account login parameters:

    $ goat account login -h
    NAME:
       goat account login - create session with PDS instance
    
    USAGE:
       goat account login [command options] [arguments...]
    
    OPTIONS:
       --username value, -u value      account identifier (handle or DID) [$ATP_AUTH_USERNAME]
       --app-password value, -p value  password (app password recommended) [$ATP_AUTH_PASSWORD]
       --auth-factor-token value       token required if password is used and 2fa is required [$ATP_AUTH_FACTOR_TOKEN]
       --pds-host value                URL of the PDS to create account on (overrides DID doc) [$ATP_PDS_HOST]
       --help, -h                      show help

***Warning: The password you provide will be stored in plain text on your computer. Consider using an app-password.***

Then, using the method and configuration specific to your AT Protocol identity, run `goat account login`.

    $ goat account login -u myawesomehandle.net -p xyz1-abc2-def3-ghi4

Then verify that your credentials are working:

    $ goat account status
