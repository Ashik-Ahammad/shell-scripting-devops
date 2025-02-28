#!/bin/bash

read -p "Enter username: " username

echo "You entered username as $username"

sudo useradd -m $username

echo "New User Added! Who is $username"
