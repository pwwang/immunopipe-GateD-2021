#!/usr/bin/env bash

# The URL to the tar file
DATAURL="https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE161192&format=file"
DATAFILE="prepared-data/GSE161192.tar"

echo "- Make the directory for prepared data ..."
mkdir -p prepared-data

echo "- Download the data if needed ..."
if [ ! -e $DATAFILE ]; then
    wget -O $DATAFILE $DATAURL
fi

echo "- Extract the data ..."
tar -xvf $DATAFILE --directory=./prepared-data

echo "- Separate desired samples ..."
for sample in $(ls -1 prepared-data/GSM* | cut -d'_' -f2 | sort -u); do
    echo "  - $sample ..."
    mkdir -p prepared-data/"$sample"
    # mv prepared-data/GSM*_"${sample}"_GEX_*.gz prepared-data/"$sample"/
    gunzip -f prepared-data/GSM*_"${sample}"_filtered_feature_bc_matrix.zip.gz
    unzip -o prepared-data/GSM*_"${sample}"_filtered_feature_bc_matrix.zip -d prepared-data/"$sample"
    ls prepared-data/GSM*_"${sample}"_filtered_contig_annotations.csv.gz
    mv prepared-data/GSM*_"${sample}"_filtered_contig_annotations.csv.gz prepared-data/"$sample"/filtered_contig_annotations.csv.gz
done

echo "- Remove unnecessary files ..."
rm -rf prepared-data/*.gz prepared-data/*.zip

echo "- Done!"
