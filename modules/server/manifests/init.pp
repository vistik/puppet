class server{
	package {["openssh-server","git-core","sudo"]: ensure => installed}
	
	add_user { "visti.kloft":
                name => "Visti Kløft",
                shell => "/bin/bash",
                uid      => 5008,
                groups   => ["sudo"],
                require => Group[sudo],
                sshkey => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC2wc/oVAD9ky9+c1DxVz36ZEd0yDjtZiCdTTI0SaSt1GreOEhkhxhBFLyAaoeGoBrStacqUZx4OZc3eJ0wTPh8cj7SI4T5DeRf2xSBp1XdjjsvePmiq1VztZdRlU1Y/Log2mzZ9PI61rG/j+gQt6dLaV0peUmPyH8rhc1v0RMNEBGBUtpVN4ircnk+1NBBLahJf89N+FGuKcYlpOdoKJM2eIViparS/+7zKqOIeJda/MRnqmmCRM+bOwklCtVQdI/MSn251fjyLWcMMdcoR3lEDEvvevtDmd6ein/XACXZqbMBUZ2HKa92WC9oOBwKS5P4gUvy3fAJxbvaDekpP8T3",
                sshkeytype => "ssh-rsa"
        }	
	
	group { sudo:
                ensure => present
        }
}
