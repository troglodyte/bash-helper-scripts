#!/bin/bash
# Change troglodyte to your own name - creates branches in a consistent way
echo "Ticket number?"
read ticket_number
title=$@
suffix=`echo $@ | awk '{print tolower($0)}'`
suffix=${suffix// /-}
#echo "ticket-$ticket_number-$suffix"
suffix="ticket-$ticket_number-troglodyte-$suffix"
git checkout -b $suffix
