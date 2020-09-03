#!/bin/bash
clear
echo 'Welcome! user'
echo 'what do you want to perform?'

function viewCollections() {
    clear
    cd $1/
    
    array=($(ls -d */))

    for i in "${array[@]}"
    do
        echo $i

        # if [ -f "data.txt" ]
        # then
        #     while IFS= read -r line
        #     do
        #         echo "$line"
        #     done < data.txt
        # fi
    done
    
    if [ -f "data.txt" ]
    then
        echo 'Data in the Document:-'
        while IFS= read -r line
        do
            echo "$line"
        done < data.txt
    fi

    echo 'which collection do you want to open'
    read cname
    # if [[ $cname = 'back' ]]
    # then
    #     cd ..
    # else
        viewDocuments $cname
    # fi

    # ls /mnt/d/Projects/Shell/DatabaseProject/database

}

function viewDocuments() {
    clear
    cd $1/
    
    array=($(ls -d */))

    for i in "${array[@]}"
    do
        echo $i
    done

    echo 'which Document do you want to view'
    read cname

    # if [[ $cname = 'back' ]]
    # then
    #     cd ..
    # else
        viewCollections $cname
    # fi
    
    # ls /mnt/d/Projects/Shell/DatabaseProject/database

}

function readQuery() {
    clear
    echo 'EnterQuery'
    read -a query
    processQuery ${query[@]}
}

function processQuery() {
    args=("$@")
    for i in ${args[@]}
    do
        if [ $i = 'data' ]
        then
            if [ -f "data.txt" ]
            then
                echo 'Data in the Document:-'
                while IFS= read -r line
                do
                echo "$line"
            done < data.txt
        fi
        else
            cd $i/
        fi
    done
}

PS3="Enter a number: "

select os in CreateDocument ViewCollections EnterQuery
do

case $os in
    "CreateDocument")
    echo "Why don't you try Linux?"
    ;;

    "ViewCollections")
    viewCollections database
    ;;

    "EnterQuery")
    readQuery
    ;;

    *)
    echo "Invalid entry."
    break
    ;;
esac
done

