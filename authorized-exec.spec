#
# spec file for package authorized-exec
#
# Copyright (c) 2024 SUSE LLC
# Copyright (c) 2024 Georg Pfuetzenreuter
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#


Name:           authorized-exec
Version:        1.1
Release:        0
Summary:        Health check
License:        EUPL-1.2
Group:          System/Monitoring
URL:            https://git.com.de/Georg/authorized-exec
Source:         %{name}-%{version}.tar.zst
BuildArch:      noarch

%description
authorized-exec is a command wrapper for use as a forced SSH command.

%prep
%autosetup

%build
# Perl script, nothing to build

%install
%make_install PREFIX=%{_prefix} MANDIR=%{_mandir} SYSCONFDIR=%{_sysconfdir}
mv %{buildroot}%{_sysconfdir}/%{name}/config.example .

%files
%license LICENSE
%doc config.example README.txt
%{_bindir}/%{name}
%{_mandir}/man1/%{name}.1%{?ext_man}
%dir %{_sysconfdir}/%{name}

%changelog
