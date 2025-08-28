#!/usr/bin/env bash

# Script to download files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Define the FTP base address
export ftpbase="ftp://ftp.ebi.ac.uk/pub/databases/opentargets/platform/latest/output/"

# # Create the list directory to save list of remote files and directories
# listpath="$localpath/list"
# echo "List path: $listpath"
# mkdir -p $listpath

# # Recursively fetch all file paths from the FTP server and write them as relative paths to files.txt
# lftp -c "
# open $ftpbase
# find
# " | grep -vE '^$|\/$' | sed 's|^\./||' > "$listpath/files.txt"

# Create the download directory
export brickpath="$localpath/brick"
echo "Brick path: $brickpath"
mkdir -p "$brickpath"

wget -r -np -nH --cut-dirs 6 -nv -P "$brickpath" "$ftpbase"

echo "Download done."