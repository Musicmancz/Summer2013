Table Descriptions in the Czysz Database
==============

#top_eqtl
eQTLs from the seeQTL database.

Removed eQTLs with lower score at same position.

    rsid       | chr_SNP | bp_SNP    | in_dhs | in_parclip | in_pictar | EntrezGeneID | GeneSymbol | log_qval                     |
    rs10000012 | chr4    |   1357324 |      0 |          0 |         0 | 285464       | CRIPAK     | -7.7101140022277830000000000 |

*in_\** is 0 or 1 depending on if each eQTL is located in a regulatory region.

#eqtl
eQTLs from seeQTL database.

Potentially multiple values for each RSID if multiple gene targets suspected

    SNP        | chr_SNP | bp_SNP  | EntrezGeneID | GeneSymbol | Qvalue   
    rs3819001  | chr1    | 1138912 | 51150        | SDF4       | -2.2404224872589110000000000 |
    rs3819001  | chr1    | 1138912 | 8784         | TNFRSF18   | -2.4866666793823240000000000

#parclip
Parclip data from the doRiNA database. Contains data on RNA-binding proteins.

Each row contains study from which the data came.

    | chrom | chromStart | chromEnd | name       | score | strand | from_paper  |
    | chr1  |     782447 |   782484 | CID_015080 |   159 | +      | Hafner 2010 |

#pictar

#starbase
CLiP-seq and Degradome-seq peak clusters.

#dhsp2
DH sites from *Sheffield 2013*.

All entries included regardless of p-value 

