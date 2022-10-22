#!/usr/bin/env bash
languages=`echo "golang python typescript csharp rust" | tr ' ' '\n'`
utils=`echo "mv sed awk curl tr printf" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if printf $languages | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    curl cht.sh/$selected/$query | bat --color=always
else
    curl cht.sh/$selected~$query | bat --color=always
fi
