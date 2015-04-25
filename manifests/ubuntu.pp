include system_requirements
include zbxsend

Class['system_requirements'] -> Class['zbxsend']

class system_requirements {
    # Sets up basic system requirements

    package { 'python':
        ensure   => present,
        provider => apt,
    }

    package { 'python-dev':
        ensure   => present,
        provider => apt,
    }

    package { 'debhelper':
        ensure   => present,
        provider => apt,
    }

    package { 'devscripts':
        ensure   => present,
        provider => apt,
    }

    package { 'python-setuptools':
        ensure   => present,
        provider => apt,
    }

    exec { 'python-pip':
        command => 'easy_install pip==1.5.4',
        path    => '/usr/bin/',
        require => Package['python-setuptools']
    }

}

class zbxsend {
    # Sets up the zbxsend project by linking things through so updates are live.
    # THIS SHOULD NOT BE USED AS A TEMPLATE FOR PRODUCTION
    exec { 'build deb':
        command => 'sudo rm -rf vagrant ; cp -r /vagrant . && cd vagrant && sudo make debs',
        path    => '/bin/:/usr/bin',
        require => [Exec['python-pip']]
    }
    
    exec { 'install deb':
        command => 'sudo dpkg -i vagrant/artifacts/debs/*.deb',
        path    => '/bin/:/usr/bin',
        require => [Exec['build deb']]
    }
}
