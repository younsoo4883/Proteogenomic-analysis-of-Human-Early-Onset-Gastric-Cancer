# Proteogenomic-analysis-of-Human-Early-Onset-Gastric-Cancer


Summary
-------

This project aims to discover meaningful molecular signatures that are difficult to obtain solely through genomic analysis by integrating genomic and proteomic data from gastric cancer patients, and to classify distinct subtypes of gastric cancer. Specifically, we focused on early-onset gastric cancer, performing multi-omics level analysis on tumor and normal tissues from diffuse-type gastric cancer patients using whole exome, transcriptome, proteome, and phosphoproteome data. As a result, we identified peptides with significantly increased phosphorylation levels in samples with specific gene mutations and found multiple signaling pathways that correlate somatic mutations with phosphopeptide levels. Additionally, we assessed the correlation between mRNA and protein levels, determining signaling pathways associated with strong correlations and investigating their relationship with patient survival outcomes. We performed clustering based on individual omics data from transcriptome and proteome to identify signature molecules for each subtype. Furthermore, integrated multi-omics clustering was conducted, leading to the identification of four subtypes, thereby improving the characterization of gastric cancer and the classification of patient groups.


Snakemake
-----------
Preprocessing from raw proteomics data using snakemake pipeline to produce proteomics quantification data. Refer to each pipeline in **02-preprocessing** directory.
Find the snakemake documentation (https://snakemake.readthedocs.io/en/stable/index.html), and view the detailed usage manuals.

    snakemake --snakefile [Snakefile] --cores [numb_of_cores] --use-conda

Downstream analysis were performed using R or python programming language.


Reference
-------

Mun DG, Bhin J, et al. Proteogenomic Characterization of Human Early-Onset Gastric Cancer. Cancer Cell. 2019 Jan 14;35(1):111-124.e10. doi: 10.1016/j.ccell.2018.12.003. PMID: 30645970.
(https://github.com/user-attachments/assets/6d4b82d6-89ef-4826-b622-e35b8558444a)
