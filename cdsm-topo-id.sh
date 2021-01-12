#!/bin/bash

# Directory of maps at http://www.madmappers.com/browse.php?TY=R.

FOLDER=data/maps/za/topographic

BASEURL="https://www.globalmapper.com/datasets/R/South%20Africa/sgSA50k/KZN/"

mkdir -p $FOLDER

CSV="cdsm-topo-id.csv"

while read -r filename
do
  echo "* $filename"

  filename=${filename}.zip
  filepath=$FOLDER/$filename
  
  if test -f "$filepath"
  then
    echo "  - $filepath already exists."
  else
    echo "  - $filepath doesn't exist."
    wget -q -O $filepath $BASEURL/$filename
    if [ $? -eq 0 ]; then
        echo "  - ✅ Download success."
    else
        echo "  - 🚨 Download failed."
        exit 1
    fi
  fi
done < $CSV