Summary:       Python library for Zabbix Sender
Name:          python-zbxsend
Version:       0.1.6.1
Release:       1%{?dist}
License:       UNKNOWN
URL:           https://github.com/pistolero/zbxsend
Source0:       %{name}-%{version}.tar.gz
Requires:      python2
BuildRequires: python2-devel
BuildArch:     noarch

%description
Python library for sending data to the Zabbix Trapper.

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{python_sitelib}

cp -p zbxsend.py %{buildroot}%{python_sitelib}


%files
%{python_sitelib}

%changelog
* Thu Jun 18 2015 Thomas Wiest <twiest@redhat.com> 0.1.6.1-1
- new package built with tito

