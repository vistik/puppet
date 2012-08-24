define add_user ( $name, $uid, $shell, $groups, $sshkeytype = '', $sshkey = '', $password = '') {
        $username = $title
        if $password {
                user { $username:
                        comment => "$name",
                        home    => "/home/$username",
                        shell   => "$shell",
                        uid     => $uid,
                        gid => $uid,
                        managehome => 'true',
                        groups => $groups,
                        password => $password,
                }
        } else {
                user { $username:
                        comment => "$name",
                        home    => "/home/$username",
                        shell   => "$shell",
                        uid     => $uid,
                        gid => $uid,
                        managehome => 'true',
                        groups => $groups
                }
        }

        group { $username:
                gid => "$uid"
        }

        if $sshkeytype and $sshkey {
                ssh_authorized_key { $username:
                        user => "$username",
                        ensure => present,
                        type => "$sshkeytype",
                        key => "$sshkey",
                        name => "$username"
                }
        }
}
