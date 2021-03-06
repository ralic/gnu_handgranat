package Handgranat::HTML;

# Tags/HTML-module for the Handgranat wiki system - https://savannah.nongnu.org/projects/handgranat/
# Karameller.pm  $Id: HTML.pm,v 1.9 2008/10/22 20:28:58 kers Exp $
# 			     $Date: 2008/10/22 20:28:58 $ $Author: kers $

# All HTML-specific functions should go here 

use 5.008008;
use strict;
use warnings;

require Exporter;
# use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Handgranat::Karameller ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw( $q &TheHeader &TheContent &GetCommonFooter &GetFormStart
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw( $q &TheHeader &TheContent &GetCommonFooter &GetFormStart
	
);

# our $VERSION=sprintf("%d.%02d", q$Revision: 1.9 $ =~ /(\d+)\.(\d+)/);
# our $ID_VER=sprintf("%s.%s", q$Id: HTML.pm,v 1.9 2008/10/22 20:28:58 kers Exp $);

our $q = new CGI;


# Preloaded methods go here.

sub TheHeader
{
my $MainPage = $_[0];
my $HostName = $ENV{SERVER_NAME};
if ($ENV{SERVER_NAME} =~ /smiley/)
	{
		s/Handgranat/Smileybreach/gi;
	}

print <<END2;

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>$MainPage</title><script src="/__utm.js" type="text/javascript"></script><script src="/__utm.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://$HostName/wiki.pl?ioncat=browse&id=Handgranat/Css&raw=1" title="blogs" type="text/css" />
<link rel="stylesheet" href="http://$HostName/wiki.pl?ioncat=browse&id=$MainPage/Css&raw=1" title="blogs" type="text/css" />
<link rel="alternate" type="application/atom+xml" title="$MainPage" href="http://$HostName/$MainPage/Blog/Atom" />
</head>
<body>
<div class="header">
<h1>${MainPage}</h1>
</div>
END2
}

sub TheContent
{
my $entries = $_[0];
print <<END2;
<div class="content">
$entries
</div>
END2
}

sub GetFormStart {
  my $HostName = $ENV{'SERVER_NAME'};

  my $ScriptName = "http://" . $HostName . "/";
 
#  $ScriptName = $ScriptName . '';
  
  return $q->startform("POST", "$ScriptName",
                       "application/x-www-form-urlencoded") . "<!-- GetFormStart -->";
}
sub GetCommonFooter {
  my ($html);

  $html = '<hr class=wikilinefooter>' . '<div class=wikifooter>'
          . &GetFormStart() . &Handgranat::GetGotoBar('')
          . &Handgranat::GetSearchForm() . $q->endform;
  $html .= $q->end_html;
  return $html;
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Handgranat::Karameller - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Handgranat::Karameller;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Handgranat::Karameller, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Christian Bolstad, E<lt>kers@atdt.nuE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Christian Bolstad, kers@atdt.nu 

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the
    Free Software Foundation, Inc.
    51 Franklin Street, Fifth Floor,
    Boston, MA  02110-1301  USA
  

=cut
