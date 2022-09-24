#!/bin/bash
codes=('1-Modulos FicherosP1' '2-Syscalls FicherosP2' '3-Drivers FicherosP3')
codedir="../../Code"
targetcodes="${PWD}/code"

ncodes=${#codes[@]}

selected_code=$1

if [ "${selected_code}" != "" ]; then
	filter_on=1
else
	filter_on=0
fi

for (( i=0 ; $i<$ncodes ; i++ ))
do
	items=(${codes[$i]})
	source_dir="${codedir}/${items[0]}/Alumnos"
	target_file="${targetcodes}/${items[1]}.tgz"

	if [ ${filter_on} -eq 1 ] && [ "${selected_code}" != "${items[1]}" ]; then
		continue
	fi

    echo "Changing to directory: $source_dir"
    cd $source_dir
    echo "Building tarball: target_file"
    tar czvf ${target_file} *
    echo "Going back to current working directory"
    cd -
done

