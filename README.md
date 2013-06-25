Summer 2013 Work
================

Todo
================
- Upload databases
  - LD Data
  - siRNA sites
  - RBP sites
- Map of LD interactions
- Queries; display data from queries

Files
================
- LD\_dl.pl: Perl script to download files from hapmap's ftp repository of LD data for upload to MySQL database. Unfortunately downloaded gzip files are corrupt. (use commandline ftp instead)
- edit.py: Takes .gz files as commandline input. Reads line by line and creates mod\_ files for each where LOD \>=3 and r-squared >= 0.6. Adds chromosome column and adds tab delineation.
-svrLD\_ul.pl: After running edit.py, takes each mod\_ file and uploads to mySQL table.  
