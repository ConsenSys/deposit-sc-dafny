#!/bin/bash

SCRIPTDIR=/Users/franck/development/deposit-sc-dafny/scripts/

#   check only one argument is passed
if [ "$#" -ne 1 ]; then
    echo "illegal number of parameters"
    exit 1
else
    #   try to generate call graph for file $1
    echo "Generating call graph for file: $1"
    # on MacOS you should have an alias dafny='mono pathToDafny.exe
    dafny /dafnyVerify:0 /funcCallGraph $1 >tmp.cfg
    if [ $? -ne 0 ]; then
        echo "Could not run command dafny /dafnyVerify:0 /funcCallGraph"
        exit 1
    else
        # use the python script to generate a dot file
        python $SCRIPTDIR/call_graph.py --func tmp.cfg --out $1.dot
        if [ $? -ne 0 ]; then
        echo "Could not run command $SCRIPTDIR/call_graph.py"
        exit 2
        else
            # Remove tmp file and exit 
            echo "Call graph generated in $1.dot"
            \rm -f tmp.cfg 
            exit 0
        fi
    fi
fi
