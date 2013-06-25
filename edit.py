"""
By Charles Czysz
Inputs: takes zip files from the LD hapmap ftp site as command line arguments
Outputs: Renames file *.txt.gz > mod_*.txt, adds chromosome column and changes from space to tab delineation
"""

import sys
import gzip
import re

zipfiles = sys.argv[1:]

for zipfile in zipfiles:
  chrom_re = re.match(r'ld_(.+)_',zipfile)
  chrom = chrom_re.group(1) #saves chromosome for writing to file

  f = gzip.open(zipfile,'rb')

  f_out = open("mod_"+zipfile[:-3],'w')

  while True:
    line = f.readline()
    if not line:
      break
    data = line.strip().split(" ")

    if float(data[-2]) >= 3.0 and float(data[-3]) >= 0.6: #only saves pairs with LOD score >= 3 and r-squared >= 0.6
      print >>f_out , chrom + "\t" + "\t".join(data)

  f.close()
  f_out.close()

