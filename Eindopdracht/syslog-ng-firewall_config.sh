#!/bin/sh
#Adding syslog-ng config

cd /etc/syslog-ng/conf.d/
sudo cat > firewalls.conf << EOF
options {
        create_dirs(yes);
        owner(root);
        group(root);
        perm(0640);
        dir_owner(root);
        dir_group(root);
        dir_perm(0750);
};
 
 
##################################################
source s_udp {
        network (
                ip-protocol(6)
                transport("udp")
                port(514)
        );
        network (
                transport("udp")
                port(514)
        );
};

EOF