# PSII-Water-Dynamics-from-Molecular-Structure-and-Phylogenetic-Comparisons
## Phylogenetic Comparative Methods

In this folder we use the amino acid sequences of PSII subunits, conducting sequence alignments for each idnetity of PSII subunit and constructing individual protein trees for each subunit. The subunits of interest were informed by previous water channel studies and the molecular modeling outcomes.

The subunits of interest are:
a) psbA (D1)
b) psbD (D2)
c) psbB (CP47)
d) psbC (CP43)
e) psbO 
f) psbS

Amino acid sequences were acquired from UniProt (https://www.uniprot.org/ ) by individually searching the respective "psb_" names and downloading the entire quarry of each subunit search. Each dataset was assessed for mis-identified proteins ensuring the data only contained sequences of the specific subunit. Data sets had sequence length assessed, in which below the 1st quantile of length was removed to ensure comparable sequence length and quality of reads and alignments. Protein sequences identified by 'fragment' were maintained if their length was greater than the 1st quantile.

Sequence data was loaded onto the HPCC for computational power. Subunit data sets were individually run through the sequence alignment program MFFAAT. Alignment quality was set to 80% and assessed via ______. Sequence alignments were run through IqTrees to reconstruct phylogenetic relationships. 

Plant trait data was collected from TRY global plant trait data base.


Phylogenetic trees were plotted in R using ______. Trait data associated with photosynthetic parameters were used to assess phylogenetic signals within each PSII subunit. Although the trait data is not directly analygus there is limited overlap between organisms with comprehensive trait data and PSII subunit sequences. 

