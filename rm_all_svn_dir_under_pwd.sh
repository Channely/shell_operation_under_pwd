#!/bin/sh

function scandir() {
    local cur_dir parent_dir workdir
    workdir=$(pwd)
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
    fi

    for dirlist in $(ls ${cur_dir})
    do
        if test -d ${dirlist};then
            cd ${dirlist}
	    rm -rf .svn
            scandir ${cur_dir}/${dirlist}
	    cd ..
        else
            echo ${cur_dir}/${dirlist}
        fi
    done
}

if test -d $1
then
    scandir $1
elif test -f $1
then
    echo "you input a file but not a directory,pls reinput and try again"
    exit 1
else
    echo "the Directory isn't exist which you input,pls input a new one!!"
    exit 1
fi
