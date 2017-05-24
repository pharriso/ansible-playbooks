cat << EOF > /home/stack/instackenv.json
{
    "nodes":[
EOF

cat instack.txt | while read MAC NAME LAST ROLE
do

cat << EOF >> /home/stack/instackenv.json
        {
            "mac":[
                "${MAC}"
            ],
	    "name":"${NAME}",
            "cpu":"1",
            "memory":"4096",
            "capabilities": "profile:${ROLE},boot_option:local",
            "disk":"40",
            "arch":"x86_64",
            "pm_type":"pxe_ssh",
            "pm_user":"stack",
            "pm_password":"$(cat /home/stack/.ssh/id_rsa  | awk {'print'} ORS='\\n')",
            "pm_addr":"192.168.10.1"
EOF
if [ $LAST = Y ] 
then
	echo "        }" >> /home/stack/instackenv.json
else
	echo "        }," >> /home/stack/instackenv.json
fi
done

cat << EOF >> /home/stack/instackenv.json
    ]
}
EOF
