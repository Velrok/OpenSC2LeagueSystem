#!/bin/bash

unfinished=1
while [ $unfinished == 1 ]
do 
    unfinished=0
    for file in *.rb
    do
        webfile="${file%.*}.html"
        ruby $file > $webfile || unfinished=1 # got an error here, mostly because a requred webfile is missing => repeat until we are done!
    done
    
    if [[ unfinished == 1 ]] 
    then
        echo "An error has occured. Assuming a required file wasn't generated jet. As a result all files will we generated again."
        echo "If there is an error in the script press Ctr+C to abord."
        echo "" 
    fi
done