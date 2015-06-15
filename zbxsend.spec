%{!?python_sitelib: %global python_sitelib %(%{__python} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")}

Name:           zbxsend
Version:        0.1.5
Release:        1%{?dist}
Summary:        Module used to send metrics to Zabbix.

License:        ASLv2
URL:            https://github.com/pistolero/zbxsend
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
BuildRequires:  python-devel

%description


%prep
%setup -q


%build
%{__python} setup.py build


%install
rm -rf $RPM_BUILD_ROOT
%{__python} setup.py install -O1 --skip-build --root $RPM_BUILD_ROOT

%files
%{python_sitelib}/*

%changelog
* Fri Apr 24 2015 Tony Rogers <tony.rogers@rackspace.com> - 0.1.6-1
- Initial Spec
