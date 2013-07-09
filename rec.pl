use strict; use warnings;
#use DBI; use DBD::MySql;
use lib '/afs/isis/pkg/mysql/libperl-' .sprintf("%vd",$^V);
use DBD::mysql;

our @total_count = (0..1000000);
our $block_total = 0;
our @rsid_found;

sub findrs2 {
  #given an rs number, forms query to find SNP2_rs associated with it
  #runs recursively until no associated SNP2 found
  my $rs1 = $_[0];
  my $chrom = $_[1];
  my $fh = $_[2];
  my $dbh = $_[3];
  my $count = $_[4];

  my $sth_2 = $_[3]->prepare("SELECT SNP2_rs from LD where SNP1_rs='$_[0]' GROUP BY SNP2_rs"); # and chrom='$chrom'");
  $sth_2->execute();

  my @rs2; 
  my $rs;
  while ($rs = $sth_2->fetchrow()){
    push(@rs2 , $rs); #build array of SNP2 values associated with given SNP1
   
  } 

  if ($#rs2 > 0) { #runs only if rs2 values are found for input rs1
    
    foreach $rs (@rs2) {
      print $fh "\n" . "  "x$count . $rs . "\n";
      $block_total++;
      if ( grep(/^$rs$/, @rsid_found) ) { #stops if snp already found
      return;
      }
      push(@rsid_found , $rs); 
      findrs2($rs,$chrom,$fh , $dbh , $count+1);
    }
  }

}


my $dbh=DBI->connect("DBI:mysql:database=czysz;host=<ip>",'<user>','<pass>') or die "Could not connect to database.";

my $sth_chrom = $dbh->prepare("SELECT chrom FROM LD GROUP BY chrom");
$sth_chrom->execute();

my $fh;
open $fh , ">outLDmap.txt";

my $fh2;
open $fh2 , ">totals.txt";

my $chrom;
my @rs2;

#while ($chrom = $sth_chrom->fetchrow()){ #go through each chromosome
  my $sth_rs1 = $dbh->prepare("SELECT SNP1_rs FROM LD WHERE chrom='chr22' GROUP BY SNP1_rs"); #select all unique first rs numbers
  $sth_rs1->execute;
  my $rs1;
  
  
  while ($rs1 = $sth_rs1->fetchrow){
      $block_total = 0;
      my $count = 0;
      push(@rsid_found , $rs1); 
      print $fh $rs1 . "\n";
      $total_count[$block_total]++;
    findrs2($rs1 , $chrom , $fh , $dbh , $count+1);
    print $fh2 $block_total;

  }
close($fh);
close($fh2);
