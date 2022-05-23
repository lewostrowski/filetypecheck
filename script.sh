#!/bin/bash

declare -a FILES
FILES=($(ls))

for F in ${FILES[@]}; do
    CHECKMIME=$(file --mime-type $F)
    readarray -d : -t FILEINFO<<< $CHECKMIME
    readarray -d . -t DECLARED<<< ${FILEINFO[0]}
    readarray -d / -t DESIRED<<< ${FILEINFO[1]}

    echo "==============================="
    echo "File name:" $F
    echo "Delcared format:" ${DECLARED[1]}
    echo "Mime type:" ${FILEINFO[1]}

    if  [ ${DESIRED[1]^^} == ${DECLARED[1]^^} ]; then  
        echo "Status: OK"
    else
        echo "Status: ERROR"
    fi
done
