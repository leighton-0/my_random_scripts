#!/usr/bin/perl

#----------------------------------------------------------------
# Name : WP_Enum
# Author : leighton-0 -- Original by https://github.com/joker25000/WP_Enum
# A cleaned up version of wp_uv.pl
# banners and user o/p removed
#----------------------------------------------------------------
use LWP::UserAgent;
use Term::ANSIColor;
use HTTP::Request::Common qw(GET);
use URI::URL;
use Getopt::Long;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

GetOptions(
	"u=s" => \$site,
);

unless ($site) { Opt(); }
if ($site) { banner(); }



sub banner() {
print "[+] $site\n";
user();
Version();
}
# GET USERNAME 
sub user(){
$user = $site . '/?author=1';

$getuser = $ua->get($user)->content;
if($getuser =~/author\/(.*?)\//){
print "[+]+---++---==[+] User: $1\n";
}else{
print clor ("BLUE");
print "[-]+---++---==[-]No User Found \n";
}
}

# GET VERSION 
sub Version(){
$getversion = $ua->get($site)->content;
if($getversion =~/content="WordPress (.*?)"/) {
print "[+]+---++---==[+] Version: $1\n";
}else{
print "[-]+---++---==[-] No Version Found \n";
}
}


# OPTION
sub Opt(){
print "USAGE : perl wp.pl -u http://victime.com ";
}
