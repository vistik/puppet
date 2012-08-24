class jenkins_install {
	package {
                ["jenkins"]:
                ensure => "1.478",
                require => [Exec["jenkins-apt-key"],File["/etc/apt/sources.list.d/jenkins.list"]]

        }

        exec { "jenkins-apt-key":
                command => "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -;apt-get update",
                user => "root",
                path => "/usr/bin:/bin",
                unless => "apt-key list | grep 'kohsuke.kawaguchi@sun.com'",
                require => File["/etc/apt/sources.list.d/jenkins.list"]
        }

        file { "/etc/apt/sources.list.d/jenkins.list":
                content => "deb http://pkg.jenkins-ci.org/debian binary/"
        }

        service {"jenkins":
                ensure => running,
                require => Package["jenkins"]
        }

	file { "/etc/default/jenkins":
		source => "puppet:///modules/jenkins_install/jenkins",
		require => Package["jenkins"],
		notify => Service["jenkins"],
	}
}
