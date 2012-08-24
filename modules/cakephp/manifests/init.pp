class cakephp{

	package { 
		[
		"zip",
		"mysql-server",
		"mysql-client",
		"apache2",
		"php5",
		"libapache2-mod-php5",
		"php-apc",
		"curl",
		"php5-curl",
		"libcurl3-dev",
		"php5-mysql",
		"php5-gd",
		"imagemagick",
		"nginx",
		"php5-mcrypt",
		"php-pear",
		
		]: 
		ensure => installed
		
	}

	exec{"enable-mod-rewrite":
		command => "a2enmod rewrite",
		path => "/usr/sbin",
		notify => Service["apache2"]
	}

	#Define apache2, mysql, nginx, apc as services using service{}
	#manage file nginx file

	#install phpunit using exec
}
