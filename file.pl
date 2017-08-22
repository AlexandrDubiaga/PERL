#!/usr/bin/perl

use strict;
use Data::Dumper;




sub readFile
{
 my($fileName) = @_;
 my @data =();
   open my $fh, "< $fileName";
	while(<$fh>)
	{
		chomp($_);
		push @data, $_;	
	}
	close($fh);
	return join ("\n",@data) unless(wantarray);
	return @data;
}
my @arr = readFile('file.txt');
my $html = readFile('file.html');

#print Dumper(@arr);
#print $html;

sub replace {
	my @data = @_;
	my %layaus = ();
	#print Dumper(\@data);
	while(@data)
	{	
		my $line =  shift @data;
		my($key,$value) = split(' => ',$line);
		$layaus{$key} = $value if($key);
	}
	return \%layaus;
	
}
my $list = replace(@arr);

$html =~ s/(\%LANG_\w+)/$list->{$1}/gse;



print $html;
