Table Descriptions in the Czysz Database
==============

# top\_eqtl #
eQTLs from the [seeQTL database](http://www.bios.unc.edu/research/genomic_software/seeQTL/).

Removed eQTLs with lower score at same position.

    rsid       | chr_SNP | bp_SNP    | in_dhs | in_parclip | in_pictar | EntrezGeneID | GeneSymbol | log_qval                     |
    rs10000012 | chr4    |   1357324 |      0 |          0 |         0 | 285464       | CRIPAK     | -7.7101140022277830000000000 |

*in_\<database\>* is 0 or 1 depending on if each eQTL is located in a regulatory region found in any other datasets.

# eqtl #

eQTLs from [seeQTL database](http://www.bios.unc.edu/research/genomic_software/seeQTL/).

Potentially multiple values for each RSID if multiple gene targets suspected

    SNP        | chr_SNP | bp_SNP  | EntrezGeneID | GeneSymbol | Qvalue   
    rs3819001  | chr1    | 1138912 | 51150        | SDF4       | -2.2404224872589110000000000 |
    rs3819001  | chr1    | 1138912 | 8784         | TNFRSF18   | -2.4866666793823240000000000 |

# GTEx #

The [Genotype-Tissue Expression](https://commonfund.nih.gov/GTEx/) program from the NIH, which contains eQTL [data](https://www.ncbi.nlm.nih.gov/gtex/GTEX2/gtex.cgi) from 
seven different tissue types.

    | ID | Analysis_ID | RS         | chr  | position | Probe_GI        | Probe_chr | Probe_pos | Gene     | Gene_ID | mRNA        | pvalue | rsquared | description                                            |
    |  1 |           1 | rs1063355  |    6 | 32627713 | ENSE00000617155 |         6 |  32609087 | HLA-DQA1 | 3117    | NM_002122.3 |      0 |        0 | major histocompatibility complex, class II, DQ alpha 1 |


# parclip #
Parclip data from the [doRiNA](http://dorina.mdc-berlin.de/rbp_browser/dorina.html) database. Contains data on RNA-binding proteins.


Each row contains study from which the data came.

    | chrom | chromStart | chromEnd | name       | score | strand | from_paper  |
    | chr1  |     782447 |   782484 | CID_015080 |   159 | +      | Hafner 2010 |


# pictar #

Pictar data from the [doRiNA](http://dorina.mdc-berlin.de/rbp_browser/dorina.html) database. Contains data on siRNA binding sites.

    | chrom | chromStart | chromEnd | name            | score | strand |
    | chr1  |     869421 |   869427 | hsa-miR-4288    |     7 | +      |


# LD #

Linkage disequilbrium data from [HapMap](ftp://ftp.hapmap.org/hapmap/ld_data/2009-04_rel27/) (rel 27).

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

    | chr   | start  | stop   | name                | BC   | strand |
    | chr11 | 206974 | 206994 | chr11_fcluster0:1:1 |    1 | +      |

# dhsp2 #
DNaseI-Hypersensitivity Sites (DHS) from *Sheffield 2013* [Source](http://genome.cshlp.org/content/23/5/777.full?sid=ec22b906-c0d7-40e8-917a-01e1a4621bb6).

All entries included regardless of p-value.

    | dhs_chr | dhs_start | dhs_end | dhs_id  | gene_chr | gene_start | gene_end | gene_name | metaprobeset_id | ensemblID       | cor          | pval         |
    | chr17   |       125 |     275 | 1051476 | chr17    |      63670 |   177334 | RPH3AL    | 15220           | ENSG00000181031 | 0.3075051010 | 0.9869999886 | 

