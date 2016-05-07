#!perl6

use v6;

use Test;
use HTTP::UserAgent;

use lib $*PROGRAM.parent.child('lib').Str;

plan 2;

throws-like {
    my $ua-sslv3          = HTTP::UserAgent.new(:ssl-protocol-version(3));
    $ua-sslv3.get("https://parabon.com/");
}, X::HTTP::Internal, "parabon.com: !SSLv3";


my $ua-tlsv1          = HTTP::UserAgent.new(:ssl-protocol-version(1));
ok $ua-tlsv1.get("https://parabon.com/").is-success, 'parabon.com: TLSv1';
