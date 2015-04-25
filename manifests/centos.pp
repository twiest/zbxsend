include system_requirements
include zbxsend

Class['system_requirements'] -> Class['zbxsend']

class system_requirements {
    # Sets up basic system requirements

    package { 'python':
        ensure   => present,
        provider => yum,
    }

    package { 'python-devel':
        ensure   => present,
        provider => yum,
    }

    package { 'rpm-build':
        ensure   => present,
        provider => yum,
    }

    package { 'python-setuptools':
        ensure   => present,
        provider => yum,
    }

    exec { 'python-pip':
        command => 'easy_install pip==1.5.4',
        path    => '/usr/bin/',
        require => Package['python-setuptools']
    }

}

class zbxsend {
    exec { 'build deb':
        command => 'sudo rm -rf vagrant ; cp -r /vagrant . && cd vagrant && sudo make rpms',
        path    => '/bin/:/usr/bin',
        require => [Exec['python-pip']]
    }

    exec { 'install deb':
        command => 'sudo rpm -ivh vagrant/artifacts/rpms/noarch/*.rpm',
        path    => '/bin/:/usr/bin',
        require => [Exec['build deb']]
    }
}
