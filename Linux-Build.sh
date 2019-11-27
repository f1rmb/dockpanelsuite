#!/usr/bin/env bash

let ret=0

function Usage()
{
    echo "$(basename $0) <target> [<target>...]"
    echo ""
    echo " - Available targets: Debug, Release, Clean"
    echo ""
}

while [[ $# -gt 0 ]]; do
    key="$1"
    
    case "$key" in
	"Debug"|"debug")
	    msbuild WinFormsUI.Docking.sln -p:Configuration=Debug /p:Platform="Any CPU"
	    ret=$?
	    if [ $ret -eq 0 ]; then
		shift
	    fi
	    ;;
	"Release"|"release")
	    msbuild WinFormsUI.Docking.sln -p:Configuration=Debug /p:Platform="Any CPU"
	    ret=$?
	    if [ $ret -eq 0 ]; then
		shift
	    fi
	    ;;
	"Clean"|"clean")
	    msbuild WinFormsUI.Docking.sln -t:Clean
	    ret=$?
	    if [ $ret -eq 0 ]; then
		shift
	    fi
	    ;;
	*)
	    Usage
	    exit 1
	    ;;
    esac
done
	
exit $ret
