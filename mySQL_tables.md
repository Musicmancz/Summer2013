Table Descriptions in the Czysz Database
==============

# top\_eqtl #
eQTLs from the [seeQTL database](http://www.bios.unc.edu/research/genomic_software/seeQTL/).

Removed eQTLs with lower score at same position.

### Table Description ###

    +--------------+--------------+------+-----+---------+-------+
    | Field        | Type         | Null | Key | Default | Extra |
    +--------------+--------------+------+-----+---------+-------+
    | rsid         | varchar(255) | NO   | PRI | NULL    |       |
    | chr_SNP      | varchar(10)  | YES  |     | NULL    |       |
    | bp_SNP       | int(20)      | YES  | UNI | NULL    |       |
    | in_dhs       | int(1)       | YES  |     | 0       |       |
    | in_parclip   | int(1)       | YES  |     | 0       |       |
    | in_pictar    | int(1)       | YES  |     | 0       |       |
    | EntrezGeneID | varchar(255) | YES  |     | NULL    |       |
    | GeneSymbol   | varchar(255) | YES  |     | NULL    |       |
    | log_qval     | float(50,25) | YES  |     | NULL    |       |
    +--------------+--------------+------+-----+---------+-------+

### Sample Data ###

    rsid       | chr_SNP | bp_SNP    | in_dhs | in_parclip | in_pictar | EntrezGeneID | GeneSymbol | log_qval                     |
    rs10000012 | chr4    |   1357324 |      0 |          0 |         0 | 285464       | CRIPAK     | -7.7101140022277830000000000 |

*in_\<database\>* is 0 or 1 depending on if each eQTL is located in a regulatory region found in any other datasets.

# eqtl #

eQTLs from [seeQTL database](http://www.bios.unc.edu/research/genomic_software/seeQTL/).

Potentially multiple values for each RSID if multiple gene targets suspected

### Table Description ###

    +--------------+--------------+------+-----+---------+-------+
    | Field        | Type         | Null | Key | Default | Extra |
    +--------------+--------------+------+-----+---------+-------+
    | SNP          | varchar(255) | YES  |     | NULL    |       |
    | chr_SNP      | varchar(10)  | YES  |     | NULL    |       |
    | bp_SNP       | int(20)      | YES  |     | NULL    |       |
    | EntrezGeneID | varchar(255) | YES  |     | NULL    |       |
    | GeneSymbol   | varchar(255) | YES  |     | NULL    |       |
    | Qvalue       | float(50,25) | YES  |     | NULL    |       |
    +--------------+--------------+------+-----+---------+-------+

### Sample Data ###

    SNP        | chr_SNP | bp_SNP  | EntrezGeneID | GeneSymbol | Qvalue   
    rs3819001  | chr1    | 1138912 | 51150        | SDF4       | -2.2404224872589110000000000 |
    rs3819001  | chr1    | 1138912 | 8784         | TNFRSF18   | -2.4866666793823240000000000 |

# GTEx #

The [Genotype-Tissue Expression](https://commonfund.nih.gov/GTEx/) program from the NIH, which contains eQTL [data](https://www.ncbi.nlm.nih.gov/gtex/GTEX2/gtex.cgi) from 
seven different tissue types.

### Table Description ###

    +-------------+--------------+------+-----+---------+-------+
    | Field       | Type         | Null | Key | Default | Extra |
    +-------------+--------------+------+-----+---------+-------+
    | ID          | int(11)      | NO   | PRI | NULL    |       |
    | Analysis_ID | int(11)      | YES  |     | NULL    |       |
    | RS          | varchar(255) | YES  |     | NULL    |       |
    | chr         | varchar(5)   | YES  |     | NULL    |       |
    | position    | int(11)      | YES  |     | NULL    |       |
    | Probe_GI    | varchar(255) | YES  |     | NULL    |       |
    | Probe_chr   | varchar(5)   | YES  |     | NULL    |       |
    | Probe_pos   | int(11)      | YES  |     | NULL    |       |
    | Gene        | varchar(255) | YES  |     | NULL    |       |
    | Gene_ID     | varchar(255) | YES  |     | NULL    |       |
    | mRNA        | varchar(255) | YES  |     | NULL    |       |
    | pvalue      | float        | YES  |     | NULL    |       |
    | rsquared    | float        | YES  |     | NULL    |       |
    | description | varchar(255) | YES  |     | NULL    |       |
    +-------------+--------------+------+-----+---------+-------+

### Sample Data ###

    | ID | Analysis_ID | RS         | chr  | position | Probe_GI        | Probe_chr | Probe_pos | Gene     | Gene_ID | mRNA        | pvalue | rsquared | description                                            |
    |  1 |           1 | rs1063355  |    6 | 32627713 | ENSE00000617155 |         6 |  32609087 | HLA-DQA1 | 3117    | NM_002122.3 |      0 |        0 | major histocompatibility complex, class II, DQ alpha 1 |


# parclip #
Parclip data from the [doRiNA](http://dorina.mdc-berlin.de/rbp_browser/dorina.html) database. Contains data on RNA-binding proteins.


Each row contains study from which the data came.

### Table Description ###

    +------------+--------------+------+-----+---------+-------+
    | Field      | Type         | Null | Key | Default | Extra |
    +------------+--------------+------+-----+---------+-------+
    | chrom      | varchar(5)   | YES  |     | NULL    |       |
    | chromStart | int(10)      | YES  |     | NULL    |       |
    | chromEnd   | int(10)      | YES  |     | NULL    |       |
    | name       | varchar(255) | YES  |     | NULL    |       |
    | score      | int(5)       | YES  |     | NULL    |       |
    | strand     | varchar(1)   | YES  |     | NULL    |       |
    | from_paper | varchar(255) | YES  |     | NULL    |       |
    +------------+--------------+------+-----+---------+-------+

### Sample Data ###

    | chrom | chromStart | chromEnd | name       | score | strand | from_paper  |
    | chr1  |     782447 |   782484 | CID_015080 |   159 | +      | Hafner 2010 |


# pictar #

Pictar data from the [doRiNA](http://dorina.mdc-berlin.de/rbp_browser/dorina.html) database. Contains data on siRNA binding sites.

### Table Description ###

    +------------+--------------+------+-----+---------+-------+
    | Field      | Type         | Null | Key | Default | Extra |
    +------------+--------------+------+-----+---------+-------+
    | chrom      | varchar(5)   | YES  |     | NULL    |       |
    | chromStart | int(10)      | YES  |     | NULL    |       |
    | chromEnd   | int(10)      | YES  |     | NULL    |       |
    | name       | varchar(255) | YES  |     | NULL    |       |
    | score      | int(3)       | YES  |     | NULL    |       |
    | strand     | varchar(1)   | YES  |     | NULL    |       |
    +------------+--------------+------+-----+---------+-------+

### Sample Data ###

    | chrom | chromStart | chromEnd | name            | score | strand |
    | chr1  |     869421 |   869427 | hsa-miR-4288    |     7 | +      |


# LD #

Linkage disequilbrium data from [HapMap](ftp://ftp.hapmap.org/hapmap/ld_data/2009-04_rel27/) (HapMap data release #27, February 2009, on NCBI B36 assembly, dbSNP b126).

### Table Description ###

    +------------+--------------+------+-----+---------+-------+
    | Field      | Type         | Null | Key | Default | Extra |
    +------------+--------------+------+-----+---------+-------+
    | chrom      | varchar(10)  | YES  |     | NULL    |       |
    | SNP1_pos   | int(11)      | YES  |     | NULL    |       |
    | SNP2_pos   | int(11)      | YES  |     | NULL    |       |
    | population | char(3)      | YES  |     | NULL    |       |
    | SNP1_rs    | varchar(255) | YES  |     | NULL    |       |
    | SNP2_rs    | varchar(255) | YES  |     | NULL    |       |
    | Dprime     | float        | YES  |     | NULL    |       |
    | R_squared  | float        | YES  |     | NULL    |       |
    | LOD        | float        | YES  |     | NULL    |       |
    | fbin       | int(11)      | YES  |     | NULL    |       |
    +------------+--------------+------+-----+---------+-------+

### Sample Data ###

    | chrom | SNP1_pos | SNP2_pos | population | SNP1_rs    | SNP2_rs    | Dprime | R_squared | LOD   | fbin |
    | chr22 | 14431347 | 14438758 | C          | rs11089130 | rs7289830  |  0.595 |     0.336 |  5.22 |  144 |

As of 18, June 2013, only includes data for chromosome 22. The data included have been filtered to have an LOD >= 3. May remove additional entries based on r-squared.

Eleven different study populations are included:

- ASW (A): African ancestry in Southwest USA
- CEU ( C): Utah residents with Northern and Western European ancestry from the CEPH collection
- CHB (H): Han Chinese in Beijing, China
- CHD (D): Chinese in Metropolitan Denver, Colorado
- GIH (G): Gujarati Indians in Houston, Texas
- JPT (J): Japanese in Tokyo, Japan
- LWK (L): Luhya in Webuye, Kenya
- MEX (M): Mexican ancestry in Los Angeles, California
- MKK (K): Maasai in Kinyawa, Kenya
- TSI (T): Toscans in Italy
- YRI (Y): Yoruba in Ibadan, Nigeria (West Africa)


# starbase #
CLiP-seq and Degradome-seq peak clusters from [starBase](http://starbase.sysu.edu.cn/).

### Table Description ###

    +--------+--------------+------+-----+---------+-------+
    | Field  | Type         | Null | Key | Default | Extra |
    +--------+--------------+------+-----+---------+-------+
    | chr    | varchar(5)   | YES  |     | NULL    |       |
    | start  | int(10)      | YES  |     | NULL    |       |
    | stop   | int(10)      | YES  |     | NULL    |       |
    | name   | varchar(255) | YES  |     | NULL    |       |
    | BC     | int(10)      | YES  |     | NULL    |       |
    | strand | varchar(1)   | YES  |     | NULL    |       |
    +--------+--------------+------+-----+---------+-------+

### Sample Data ###

    | chr   | start  | stop   | name                | BC   | strand |
    | chr11 | 206974 | 206994 | chr11_fcluster0:1:1 |    1 | +      |

# dhsp2 #
DNaseI-Hypersensitivity Sites (DHS) from *Sheffield 2013* [Source](http://genome.cshlp.org/content/23/5/777.full?sid=ec22b906-c0d7-40e8-917a-01e1a4621bb6).

All entries included regardless of p-value.

### Table Description ###

    +-----------------+--------------+------+-----+---------+-------+
    | Field           | Type         | Null | Key | Default | Extra |
    +-----------------+--------------+------+-----+---------+-------+
    | dhs_chr         | varchar(5)   | YES  |     | NULL    |       |
    | dhs_start       | int(10)      | NO   | PRI | NULL    |       |
    | dhs_end         | int(10)      | YES  | UNI | NULL    |       |
    | dhs_id          | int(10)      | YES  |     | NULL    |       |
    | gene_chr        | varchar(5)   | YES  |     | NULL    |       |
    | gene_start      | int(10)      | YES  |     | NULL    |       |
    | gene_end        | int(10)      | YES  |     | NULL    |       |
    | gene_name       | varchar(255) | YES  |     | NULL    |       |
    | metaprobeset_id | varchar(255) | YES  |     | NULL    |       |
    | ensemblID       | varchar(255) | YES  |     | NULL    |       |
    | cor             | float(10,10) | YES  |     | NULL    |       |
    | pval            | float(10,10) | YES  |     | NULL    |       |
    +-----------------+--------------+------+-----+---------+-------+

### Sample Data ###

    | dhs_chr | dhs_start | dhs_end | dhs_id  | gene_chr | gene_start | gene_end | gene_name | metaprobeset_id | ensemblID       | cor          | pval         |
    | chr17   |       125 |     275 | 1051476 | chr17    |      63670 |   177334 | RPH3AL    | 15220           | ENSG00000181031 | 0.3075051010 | 0.9869999886 | 

# snp\_stop #

Contains data on SNPs in stop codons of mRNA. A residue of "*" indicates a SNP associated with a stop codon.

### Table Description ###

    +---------------+--------------+------+-----+---------+-------+
    | Field         | Type         | Null | Key | Default | Extra |
    +---------------+--------------+------+-----+---------+-------+
    | snp_id        | varchar(255) | NO   | PRI | NULL    |       |
    | contig_acc    | varchar(255) | YES  |     | NULL    |       |
    | contig_ver    | int(11)      | YES  |     | NULL    |       |
    | asn_from      | int(11)      | YES  |     | NULL    |       |
    | asn_to        | int(11)      | YES  |     | NULL    |       |
    | locus_id      | int(11)      | YES  |     | NULL    |       |
    | locus_symbol  | varchar(255) | YES  |     | NULL    |       |
    | mrna_acc      | varchar(255) | YES  |     | NULL    |       |
    | mrna_ver      | int(11)      | YES  |     | NULL    |       |
    | protein_acc   | varchar(255) | YES  |     | NULL    |       |
    | protein_ver   | int(11)      | YES  |     | NULL    |       |
    | fxn_class     | int(11)      | YES  |     | NULL    |       |
    | reading_frame | int(11)      | YES  |     | NULL    |       |
    | allele        | varchar(255) | YES  |     | NULL    |       |
    | residue       | varchar(255) | YES  |     | NULL    |       |
    | aa_position   | int(11)      | YES  |     | NULL    |       |
    | build_id      | varchar(255) | YES  |     | NULL    |       |
    | ctg_id        | int(11)      | YES  |     | NULL    |       |
    | mrna_pos      | int(11)      | YES  |     | NULL    |       |
    | random1       | varchar(255) | YES  |     | NULL    |       |
    | codon         | varchar(255) | YES  |     | NULL    |       |
    | protRes       | varchar(255) | YES  |     | NULL    |       |
    | random2       | varchar(255) | YES  |     | NULL    |       |
    | random3       | varchar(255) | YES  |     | NULL    |       |
    | random4       | varchar(255) | YES  |     | NULL    |       |
    +---------------+--------------+------+-----+---------+-------+

### Sample Data ###

    +------------+------------+------------+----------+----------+----------+--------------+--------------+----------+--------------+-------------+-----------+---------------+--------+---------+-------------+----------+-----------+----------+---------+-------+---------+-----------+-----------+---------+
    | snp_id     | contig_acc | contig_ver | asn_from | asn_to   | locus_id | locus_symbol | mrna_acc     | mrna_ver | protein_acc  | protein_ver | fxn_class | reading_frame | allele | residue | aa_position | build_id | ctg_id    | mrna_pos | random1 | codon | protRes | random2   | random3   | random4 |
    +------------+------------+------------+----------+----------+----------+--------------+--------------+----------+--------------+-------------+-----------+---------------+--------+---------+-------------+----------+-----------+----------+---------+-------+---------+-----------+-----------+---------+
    | rs10009430 | NT_016354  |         19 | 54578483 | 54578483 |   132321 | C4orf33      | NM_001099783 |        1 | NP_001093253 |           1 |        41 |             1 | T      | *       |         143 | 37_4     | 224514665 |      521 | 521     | TGA   | OPA     | 224514665 | 153251888 | 0       |
    +------------+------------+------------+----------+----------+----------+--------------+--------------+----------+--------------+-------------+-----------+---------------+--------+---------+-------------+----------+-----------+----------+---------+-------+---------+-----------+-----------+---------+

# snp\_in\_exon #

RSIDs of results from dbSNP given the query
 
    (((Human[Organism]) AND STOP-GAIN[Function Class]) OR STOP-LOSS[Function Class]) OR missense[Function Class]

in order to find SNPs in exons which can cause regulatory changes.

# SNP\_stop #

RSIDs of SNP results from dbSNP where residue = '*', indicating a stop codon.
