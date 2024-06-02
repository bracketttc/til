#!/bin/sh

dir=$(date +%Y/%m/%d)
mkdir -p "${dir}"
lesson="${dir}/README.md"
if [ ! -f "${lesson}" ]; then
    printf "# Today I Learned %s\n\n" "$(date +%Y%m%d)" > "${lesson}"
fi
vim "${lesson}"
