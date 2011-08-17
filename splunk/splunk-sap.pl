#!/usr/bin/perl
use strict;
use warnings;
use sapnwrfc;


if (@ARGV==0) {
  print <<USAGE;
$0 requires two arguments
    $0 /path/to/sap.yml ZPLUNK_TABLE_NAME
USAGE
 exit 1;
}

my $sap_config = $ARGV[0];
my $task_type = $ARGV[1];

die "Config file '$sap_config' does not exist" unless -f $sap_config;

die "Task type is not defined" unless defined $task_type;


SAPNW::Rfc->load_config($sap_config);
my $conn = SAPNW::Rfc->rfc_connect;
my $rd = $conn->function_lookup("ZPLUNK_GET");
my $rc = $rd->create_function_call;
$rc->DATASET($task_type);
$rc->invoke;
foreach my $row (@{$rc->RESULT}) {
    print values %$row;
    print $/;
}
$conn->disconnect;

exit;
