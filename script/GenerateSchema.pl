
#!perl

use Modern::Perl;
use DBIx::Class::Schema::Loader 'make_schema_at';

my $DEBUG = @ARGV and $ARGV[0] =~ /^\-[\-]*v/;

say $DBIx::Class::Schema::Loader::VERSION if $DEBUG;

my $host = 'localhost:8080';
my $port = '3306';
my $database = 'greflynn';
my $uid = 'root';
my $pwd = 'MySqlPass!?';
#my @dsn = "DBI:mysql:database=$database;host=$host;port=$port;user=$uid;password=$pwd";
my @dsn = 'DBI:ODBC:DRIVER={SQL Server};SERVER=ENNTEST;DATABASE=test;, test, test';
#my @dsn = 'dbi:ODBC:driver={SQL Server};Server=ENNTEST;database=AnimalControlApp-DEV;network=COVDNSSRV;';

my $options = {
  debug          => $DEBUG,
  dump_directory => 'lib',
  components     => [qw/ InflateColumn::DateTime /],
  generate_pod   => 0,
};

make_schema_at('Application::User_Accounts' => $options, \@dsn);

=head1 NAME
generate_dbic_schema
=head1 USAGE
perl generate_dbic_schema
=cut
