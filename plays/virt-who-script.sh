#!/usr/bin/expect
set password [lindex $argv 0]
spawn /usr/bin/virt-who-password 
expect assword
send $password\r
interact
