#!/usr/bin/env bash
# Generate CMD.help.txt file for each edgectl command,
# using "edgectl CMD --help > edgectl_CMD.help.txt". The generated
# help text is included from the corresponding markdown
# file. Note that whitespace is replaced with underscore,
# e.g. "edgectl get account" --> edgectl_get_account.help.txt

set -e

# Always execute in this dir
cd $(dirname "$0")


IFS=$'\n'
cmds=( $(edgectl x list-cmds --hidden=false | jq -r '.[].path') )

rm -f ./*.help.txt


for cmd in "${cmds[@]}"; do
  # space -> underscore, e.g. "edgectl get account" -> "edgectl_get_account"

  echo $cmd
  cmd_path=${cmd:8}
  cmd_underscore="${cmd_path// /_}"

  hlp="${cmd_underscore}.help.txt"
  md="${cmd_underscore}.md"

  # shellcheck disable=SC2086
  bash -c "$cmd --help" > $hlp

  # If the markdown file doesn't exist, create it
  if [ ! -f "$md" ]; then
cat <<- EOF > "$md"
---
title: "$cmd_path"
description: "FIXME"
draft: false
menu:
  docs:
    identifier: "${cmd_underscore}"
    parent: edgectl
toc: true
command_reference: true
---

## Help

{{< readfile file="${hlp}" code="true" lang="text" >}}
EOF
  fi


done


