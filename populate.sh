#!/bin/sh

BASEDIR=${1?BASEDIR is required, must be set to directory containing lexicon NSIDs}

WDIR="${BASEDIR}/community/lexicon/"

if [ ! -d "$WDIR" ]; then
  echo "$WDIR does not exist."
fi

echo "Populating lexicon with NSIDs from $WDIR"

workspace=$(mktemp -d "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXXXX")

for file in "$WDIR"/*
do
    if [ ! -d "${file}" ] ; then
        echo "${file} is a file"
    else
        SUBDOMAIN=$(basename "$file")
        NSID="community.lexicon.${SUBDOMAIN}"

        for definition in "$file"/*.json
        do
            filename=$(basename -- "$definition")
            filename="${filename%.*}"
            RKEY="${NSID}.${filename}"
            echo "Creating ${RKEY}"

            goat lex parse "${definition}"

            jq -s '{"$type": "com.atproto.lexicon.schema"} *.[0]' "${definition}" > "${workspace}/${RKEY}.json"
            echo "Created ${workspace}/${RKEY}.json"

            goat record create --rkey="${RKEY}" "${workspace}/${RKEY}.json"
        done

    fi
done