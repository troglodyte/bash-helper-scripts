#!/bin/bash

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
branch_name="ticket-$ticket_number-your_username_here-$suffix"

git checkout -b $branch_name
