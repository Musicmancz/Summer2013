#For use after running edit.py to make mod_* files in current directory
#Uploads to LD table of czysz database on Laederach mySQL server
#CAUTION: Currently drops LD before populating
#
#Usage: cd to dir with mod* files
#  perl svrLD_ul.pl <mysqlpass>

use strict; use warnings;
use Cwd;
use lib '/afs/isis/pkg/mysql/libperl-' .sprintf("%vd",$^V);
use DBD::mysql;

sub uploadtoDB {
  my $curr_file = $_[0];
  my $dbh = $_[1];
  my $dir = $_[2];

  my $file_dir = $dir . "/" . $curr_file;
  my $sth = $dbh->prepare("load data local infile '$file_dir' into table LD") or die $dbh->errstr;
  
  $sth->execute;


}
my $pass = $ARGV[-1];
exit 0 if $pass =~ /.pl$/; #exits if password not given


my $dbh=DBI->connect("DBI:mysql:database-czysz;host=152.2.15.164,'charlesczysz',$pass") or die "Cannot connect to mysql";

my $sth;

$sth = $dbh->prepare("drop table if exists LD");
$sth->execute();

$sth = $dbh->prepare("create table LD (
  chrom varchar(10) , 
  SNP1_pos int , 
  SNP2_pos int , 
  population char(3) , 
  SNP1_rs varchar(255) ,
  SNP2_rs varchar(255) ,
  Dprime float,
  R_squared float ,
  LOD float,
  fbin int
  )"
);
$sth->execute();

my $currdir = cwd();
$currdir =~ s/ /\ /; #escape any spaces in path

opendir DIR , $currdir or die "Couldn't open directory";
my @currdir_files = readdir DIR; #Saves list of current files in directory, used later to prevent re-downloading of files
closedir DIR;

my $current_file;
foreach $current_file (@currdir_files) {
  if ($current_file =~ /^mod_/) {
    uploadtoDB($current_file,$dbh,$currdir);

    unlink($current_file);
  }
}

