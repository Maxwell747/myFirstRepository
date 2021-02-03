#!/bin/bash

if [ $# -eq 0]; then
    echo "usage: modify filename [filename ...]"
    exit 0
fi

date_time = $ (date "+%A, %b %d, %Y: %H%M")

for f in "$@"/*
do
    if [[ -d "$f" ]]; then
        echo "modify: '$f', is a directory."
    elif [[ -x "$f" ]]; then
        echo "modify: '$f', cannot edit executables."
    elif [ "$(file "$f")" = "$f: ASCII text" ]; then
        ed <<- EOF > $f
        Modified on: $date_time
        Modified by: Maxwell Slingerland
        EOF
        ed $f
        2m0
        s/Gradez/Grades
        w
        q
    else
        echo "modify: '$f', filetype not supported."
done