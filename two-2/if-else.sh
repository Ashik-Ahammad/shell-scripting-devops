#!/bin/bash

<< Disclaimer
This is just a comment
Disclaimer

read -p "What is this year: " year

if [[ $year == "2025" ]]; 
then
	echo "You're right this is 2025"
else
	echo "Wrong!! This is not $year"
fi
