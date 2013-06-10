use strict; use warnings;
use Net::FTP;
use Cwd;

my $host = "ftp.hapmap.org";

my $ftp = Net::FTP->new($host) or die "Can't open $host\n";

$ftp->login("anonymous",'-anonymous@')
      or die "Cannot login ", $ftp->message;

my $dir = "hapmap/ld_data/2009-04_rel27/";
$ftp->cwd($dir) or die "Can't cwd to $dir\n";

$, = "\n";
my @files = $ftp->ls;
#print @files, "\n";

my $file_to_get = "ld_chr10_MEX.txt.gz";

my $currdir = cwd();
$currdir =~ s/ /\ /;
print($currdir . "\n");

my $dh;
opendir DIR , $currdir or die "Couldn't open directory";
my @currdir_files = readdir DIR;
closedir DIR;

#print @currdir_files;

if (!($file_to_get ~~ @currdir_files)) { #tests if zip already exists

print "hi, downloading...\n";
$ftp->get($file_to_get) or die "Can't get $file_to_get from $dir\n";

}

#File name format: ld_<chrom>_<population>.txt.gz

#Column format: 
#Col1: Chromosomal position of marker1
#Col2: chromosomal position of marker2
#Col3: population code
#Col4: rs# for marker1
#Col5: rs# for marker2
#Col6: Dprime
#Col7: R square
#Col8: LOD
#Col9: fbin ( index based on Col1 ) 

#unzip
#import, edit fields to include chromosome 

