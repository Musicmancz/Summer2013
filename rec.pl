use strict; use warnings;
#use DBI; use DBD::MySql;
use lib '/afs/isis/pkg/mysql/libperl-' .sprintf("%vd",$^V);
use DBD::mysql;

our $block_total; #Stores size of LD block associated with original RSID1 value
our @rsid_found; #Array storing the rsids found in an LD block, prevents infinite cycles of LD
our $fh; #File handler for outLDmap.txt
our $fh2;
our $dbh;

sub findrs2 {
  #given an rs number, forms query to find SNP2_rs associated with it
  #runs recursively until no associated SNP2 found
  my $rs1 = $_[0];
  my $chrom = $_[1];
  #my $fh = $_[2];
  #my $dbh = $_[3];
  my $count = $_[2];
  #my $group = $_[3];

  my $sth_2 = $dbh->prepare("SELECT SNP2_rs from LD where SNP1_rs='$_[0]' AND chrom = $chrom GROUP BY SNP2_rs");
  #my $sth_2 = $dbh->prepare("SELECT SNP2_rs from LD where SNP1_rs='$_[0]' AND chrom = $chrom AND population = '$group' GROUP BY SNP2_rs");
  $sth_2->execute();

  my @rs2; 
  my $rs;
  while ($rs = $sth_2->fetchrow()){
    push(@rs2 , $rs); #build array of SNP2 values associated with given SNP1
   
  } 

  if ($#rs2 > 0) { #runs only if rs2 values are found for input rs1
    
    foreach $rs (@rs2) {
      print $fh "  "x$count . $rs . "\n";
      $block_total++;
      
      if ( grep(/^$rs$/, @rsid_found) ) { #stops if snp already found
      return;
      }

      push(@rsid_found , $rs); 
      findrs2($rs,$chrom, $count+1); #$group
    }
  }

}


$dbh=DBI->connect("DBI:mysql:database=czysz;host=<ip>",'<user>','<pass>') or die "Could not connect to database.";

my $sth_chrom = $dbh->prepare("SELECT chrom FROM LD GROUP BY chrom");
$sth_chrom->execute();

my $sth_pop = $dbh->prepare("SELECT population FROM LD GROUP BY population");
$sth_pop->execute();

my @pop; my $group;
while ($group = $sth_pop->fetchrow) {
  push(@pop , $group); #array of the different populations
}

open $fh , ">outLDmap.txt";

open $fh2 , ">totals.txt";

my $chrom;
my @rs2;

#while ($chrom = $sth_chrom->fetchrow()){ #go through each chromosome
#foreach $group (@pop) {
  my $sth_rs1 = $dbh->prepare("SELECT SNP1_rs FROM LD WHERE chrom='chr22' GROUP BY SNP1_rs"); #select all unique first rs numbers
  #my $sth_rs1 = $dbh->prepare("SELECT SNP1_rs FROM LD WHERE chrom='$chrom' GROUP BY SNP1_rs"); #select all unique first rs numbers
  $sth_rs1->execute;
  
  open $fh2 , ">totals.txt"; #">" . $group . "_totals.txt";  #Stores size of each LD block on a per population basis

  my $rs1;
  while ($rs1 = $sth_rs1->fetchrow){
      $block_total = 1; #$rs1 here is first member of LD block
      my $count = 0; #Degree of separation from original RSID

      @rsid_found = (); 

      push(@rsid_found , $rs1); 
      
      print $fh $rs1 . "\n";
      
      findrs2($rs1 , $chrom , $count+1);
      #findrs2($rs1 , $chrom , $count+1 , $group);
      
      print $fh2 $block_total . "\n";

  }
#}
  #}
close($fh);
close($fh2);
