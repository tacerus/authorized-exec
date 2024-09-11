#!/usr/bin/perl -W
# Wrapper to be used as a forced SSH command.
#
# Copyright 2024, Georg Pfuetzenreuter <mail@georg-pfuetzenreuter.net>
#
# Licensed under the EUPL, Version 1.2 or - as soon they will be approved by the European Commission - subsequent versions of the EUPL (the "Licence").
# You may not use this work except in compliance with the Licence.
# An English copy of the Licence is shipped in a file called LICENSE along with this applications source code.
# You may obtain copies of the Licence in any of the official languages at https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12.

use v5.26;	# Leap 15.6

use List::Util 'any';

die "Usage: $0 <config> <command line>" unless @ARGV;

my $configfile = shift @ARGV;
	die "File $configfile does not exist" unless -f $configfile;

my %config = do $configfile;
	die "Couldn't parse $configfile: $@" if $@;
	die "Couldn't run $configfile"       unless %config;

my $user = $ENV{'USER'};

if (! exists($config{$user}) ) {
	print STDERR 'Unauthorized user.';
	exit 1
}

my $cmd;
my $ssh_cmd = $ENV{'SSH_ORIGINAL_COMMAND'};

if ($ssh_cmd) {
	$cmd = $ssh_cmd;
} elsif (@ARGV) {
	$cmd = qq{@ARGV};
} else {
	print STDERR 'Missing command.';
	exit 1
}

my %cmds = map { qr{$_} => 1 } @{$config{$user}};

if ( any { $cmd =~ $_ } keys %cmds ) {
	exec $cmd;
} else {
	print STDERR 'Execution denied.';
	exit 1
}
