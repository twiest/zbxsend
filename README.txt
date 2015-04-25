=====
Usage
=====

Sample usage:::

    >>> from zbxsend import Metric, send_to_zabbix    
    >>> send_to_zabbix([Metric('localhost', 'bucks_earned', 99999)], 'localhost', 10051)

=====
Build
=====

To build an RPM:::
    >>> make rpms
    >>> yum install ./artifacts/rpms/noarch/*.rpm 

To build a deb:::
    >>> make debs
    >>> apt-get install ./artifacts/deb/*.deb

=======
Vagrant
=======

To test building a package (rpm/deb) and installing that package:::
    >>> vagrant up centos
    >>> vagrant up ubuntu
