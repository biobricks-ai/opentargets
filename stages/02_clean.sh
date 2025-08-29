#!/usr/bin/env bash

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Create the raw directory
export downloadpath="$localpath/download"
echo "Download path: $downloadpath"

export brickpath="$localpath/brick"
echo "Brick path: $brickpath"
mkdir -p "$brickpath"

find "$downloadpath" -type f -name "_SUCCESS" -delete

for dir in "$downloadpath"/*/; do
  # Check if it's a directory and does not already end with .parquet
  if [ -d "$dir" ]; then
    dirname=$(basename "$dir")
    if [[ ! "$dirname" =~ \.parquet$ ]]; then
      cp -r "$downloadpath/$dirname" "$brickpath/${dirname}.parquet"
    fi
  fi
done

echo "Processing done."