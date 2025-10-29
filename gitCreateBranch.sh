#!/bin/bash

# Git create branch
function gcb {
    echo "Ticket number?"
    read ticket_number

    title=$@

    suffix=`echo $@ | awk '{print tolower($0)}'`

    # Filter out unwanted strings
    suffix=${suffix//[\!,.-@?.\/]/}

    # trim extra spaces
    suffix=`echo $suffix | tr -s " "`

    # Extract substring
    suffix=${suffix:0:45}

    # Strip trailing space
    suffix="$(echo -e "${suffix}" | sed -e 's/[[:space:]]*$//')"

    # replace spaces with dashes
    suffix=${suffix// /-}

    ticket_number=`echo $ticket_number | awk '{print tolower($0)}'`
    # branch_name="ADM-$ticket_number-$USER-$suffix" # with user name
    branch_name="MINT-$ticket_number-$suffix"

    git checkout -b "feature/$branch_name"
    # git flow feature start $branch_name # via git flow
}
