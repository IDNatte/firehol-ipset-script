#!/usr/bin/bash

source ./ipset-update.conf

mkdir -p "${TMP}/${TMP_DOWNLOAD_BASE}"
cd "${TMP}/${TMP_DOWNLOAD_BASE}" || exit 1

while IFS= read -r url; do
	[ -n "$url" ] && curl -sO "$url"
done < "$IPSET_CONFIG_DOWNLOADLIST"

for netset_file in *.netset *.ipset; do
	[ -e "$netset_file" ] || continue
	ipset-apply.sh "$netset_file"
done

netfilter-persistent save

cd "../"
rm -rf "${BASE}"
