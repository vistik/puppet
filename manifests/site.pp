import "users"
import "hostname"
node base{
	include os
}

node jenkins inherits debian{
	include jenkins_install
	set_hostname{"jenkins":}
}

node debian inherits base{
	include cakephp	
}
