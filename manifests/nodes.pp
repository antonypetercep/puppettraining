class linux {

$ntpserv = $osfamily ? {

   'redhat' => 'ntpd',
    defaul => 'ntp',
             }
$packages = ['nano','telnet','ntp']

file {'/info.txt' :
  ensure => 'present',
  content => inline_template("Created by Puppet at <%= Time.now %>\n"),
     }
file {'/newfile':
  ensure => present,
  mode   => 0600,
  content => "This is of type ${osfamily}",
}
package {$packages :
    ensure => 'installed',
        }
service {$ntpserv :
  ensure => 'running',
  enable => 'true',
        }
}     

node 'wiki.xenrtcloud' {
  hiera_include('classes')
}
