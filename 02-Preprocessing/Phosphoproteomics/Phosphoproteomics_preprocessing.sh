#!/bin/bash

##############################
#    ThermoRawFileParser     #
##############################

# Give your job a name
#SBATCH -J Phospho_preprocessing

# Define how may CPUs you need
#SBATCH -n 2

# Define the number of nodes
#SBATCH -N 1

# Define the node number
#SBATCH -p node9

# Define the output file name
#SBATCH -o Phospho_preprocessing.%j.out

# Define the error file name
#SBATCH -e Phospho_preprocessing.%j.error

# Define the number of CPU cores per task
#SBATCH --cpus-per-task=1


#################################
# Check if the directory is provided 
if [ -z "$1" ]; then
  echo "Error: No directory provided"
  echo "Usage: sbatch $0 <directory_name>"
  exit 1
fi


#Initialize conda
source /opt/ohpc/pub/anaconda3/etc/profile.d/conda.sh

# Activate Sage environment
source /opt/ohpc/pub/anaconda3/bin/activate Sage

#Input directory as user-input variable
SAMPLE=$1
RAW_DIR="/data/Storage_DAS03/mentee/GastricCancer/raw/phosphoproteomics/PDC000215/1/Raw_Mass_Spectra"
SAMPLE_PREFIX=`echo $SAMPLE | cut -d '_' -f 2,3`


#Output directory
mzML_DIR="/data/Storage_DAS03/mentee/GastricCancer/raw/GC_phospho_proteome/mzML"
LOG_DIR=${mzML_DIR}/log

mkdir -p ${mzML_DIR}/${SAMPLE}

# Run ThermoRawFileParser
ThermoRawFileParser -d=${RAW_DIR}/${SAMPLE}/Proprietary -o=${mzML_DIR}/${SAMPLE} -f=2 -g -m=0 2> ${LOG_DIR}/${SAMPLE_PREFIX}.thermo.log

# Activate openms environment
#conda activate openms 
source /opt/ohpc/pub/anaconda3/bin/activate openms

# Run FileMerger
FileMerger -in ${mzML_DIR}/${SAMPLE}/*.mzML.gz -in_type 'mzML' -out ${mzML_DIR}/merged_mzML/${SAMPLE_PREFIX}.merged.mzML 2> ${LOG_DIR}/${SAMPLE_PREFIX}.FileMerger.log

# Activate Sage environment
#conda activate Sage
source /opt/ohpc/pub/anaconda3/bin/activate Sage

# Run SAGE
sage ${mzML_DIR}/merged_mzML/phospho.json -o ${mzML_DIR}/merged_mzML 2> ${LOG_DIR}/run_sage.log
