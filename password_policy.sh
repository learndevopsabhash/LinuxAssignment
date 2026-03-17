#!/bin/bash

CONFIG="/etc/security/pwquality.conf"

echo "Updating password policy..."

set_policy () {
    KEY=$1
    VALUE=$2

    if grep -q "^$KEY" $CONFIG; then
        sed -i "s/^$KEY.*/$KEY = $VALUE/" $CONFIG
    else
        echo "$KEY = $VALUE" >> $CONFIG
    fi
}

set_policy minlen 8
set_policy dcredit -1
set_policy ucredit -1
set_policy lcredit -1
set_policy ocredit -1
set_policy retry 3

echo "Password policy updated successfully."
