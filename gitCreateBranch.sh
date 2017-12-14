#!/bin/bash

echo "Ticket number?"
read ticket_number

title=$@
suffix=`echo $@ | awk '{print tolower($0)}'`

# Filter out unwanted strings 
suffix=${suffix//[\!,.-@?.\/]/}

# trim extra spaces
suffix=`echo $suffix | tr -s " "`

# replace spaces with dashes
suffix=${suffix// /-} 

ticket_number=`echo $ticket_number | awk '{print tolower($0)}'`
branch_name="ticket-$ticket_number-mharris-$suffix"

git checkout -b $branch_name
