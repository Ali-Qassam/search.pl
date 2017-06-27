#!/usr/bin/perl -w
use strict;
use warnings;
use LWP;
use IO::Socket::INET;
use IO::Socket::SSL;
use Getopt::Long;
use Config;

$SIG{'PIPE'} = 'IGNORE';    #Ignore broken pipe errors

print <<EOTEXT;

 ██████╗ █████╗ ███╗   ██╗ ██████╗███████╗██████╗     
██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗    
██║     ███████║██╔██╗ ██║██║     █████╗  ██████╔╝    
██║     ██╔══██║██║╚██╗██║██║     ██╔══╝  ██╔══██╗    
╚██████╗██║  ██║██║ ╚████║╚██████╗███████╗██║  ██║    
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝  ╚═╝    
                                                   

EOTEXT





my $url="https://www.google.ps/search?q=php id= israel shop";

my $browser=LWP::UserAgent->new;
$browser->agent('Mozilla/4.76 [en]');
$browser-> cookie_jar({});

my $demande= $browser->get($url);

my $response= $demande->content;

while ($response =~ m/((https?):\/\/([^"\>]*))/g) {
	my $link = $1;
	print "$link \n";
}

