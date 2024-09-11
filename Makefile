# Makefile for authorized-exec
#
# Copyright 2024, Georg Pfuetzenreuter <mail@georg-pfuetzenreuter.net>
#
# Licensed under the EUPL, Version 1.2 or - as soon they will be approved by the European Commission - subsequent versions of the EUPL (the "Licence").
# You may not use this work except in compliance with the Licence.
# An English copy of the Licence is shipped in a file called LICENSE along with this applications source code.
# You may obtain copies of the Licence in any of the official languages at https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12.

PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/man
SYSCONFDIR=$(PREFIX)/etc

usage:
	@echo 'Available targets: "install", "uninstall"'

install:
	install -d '$(DESTDIR)$(BINDIR)' '$(DESTDIR)$(MANDIR)' '$(DESTDIR)$(SYSCONFDIR)' '$(DESTDIR)$(SYSCONFDIR)/authorized-exec'
	install authorized-exec.pl '$(DESTDIR)$(BINDIR)/authorized-exec'
	install -m 0644 config.example.pl '$(DESTDIR)$(SYSCONFDIR)/authorized-exec/config.example'
	pod2man authorized-exec.pod > '$(DESTDIR)$(MANDIR)/man1/authorized-exec.1'

uninstall:
	rm '$(BINDIR)/authorized-exec'
	rm '$(SYSCONFDIR)/authorized-exec/config.example' || :
	rm '$(MANDIR)/man1/authorized-exec.1'
