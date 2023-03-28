#!/bin/bash

if [[ $1 != '' ]]; then
    if [[ $1 == 'log' ]]; then
        if [[ $2 != '' ]]; then
            echo "commitID is $2"
            log=$(git log $2)
        else
            echo "get latest log"
            log=$(git log -1)
        fi
    elif [[ $1 == 'tag' ]]; then
        if [[ $2 != '' ]]; then
            echo "tag is $2"
            log=$(git log $tagName)
        else
            tagName=$(git describe --abbrev=0 --tags)
            echo "tag is $tagName"
            log=$(git log $tagName)
        fi
    fi

else
    echo "get latest log"
    log=$(git log -1)

fi

echo $log
echo ::set-output name=log::$log
export log=$log
