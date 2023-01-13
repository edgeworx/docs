#!/usr/bin/env bash
# Generate CMD.help.txt file for each edgectl command,
# using "edgectl CMD --help > edgectl_CMD.help.txt". The generated
# help text is included from the corresponding markdown
# file. Note that whitespace is replaced with underscore,
# e.g. "edgectl get account" --> edgectl_get_account.help.txt

set -e

md="file.md"

if [ ! -f $md ]; then
cat <<- EOF > $md
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF
fi


