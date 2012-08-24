define set_hostname(){
	$hostname = $title
	file{ "/etc/hostname":
		content => "$hostname"
	}
	
	file{ "/etc/apache2/conf.d/fqdn":
		content => "ServerName $hostname"
	}

	file{ "/etc/hosts":
		content => template("hostname/hosts")
	}

	exec{ "update-hostname":
		command => "/etc/init.d/hostname.sh start",
		path => "/bin",
		require => File["/etc/hostname"],
		#unless => "[ `hostname` == '$hostname' ]",
	}
}
