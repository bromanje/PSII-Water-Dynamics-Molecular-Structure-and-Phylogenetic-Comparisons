#!/bin/bash

#SBATCH --job-name Pylo_Compare   # give the job a name
#SBATCH -A   Phylo_Compare  # specify the account
#SBATCH -t 0-48:00               # how much time?
#SBATCH --nodes=1                       # how many nodes?
#SBATCH --cpus-per-task=16      # 2 cores
#SBATCH --mem=60G                       # 50 GB memory
#SBATCH --mail-type=ALL         # Send emails on start, fail, completion
#SBATCH --mail-user= email  # specify your email
#SBATCH -e err_iqtree_cas_%A.err                # name error files and include job ID (%A)
#SBATCH -o std_iqtree_cas_%A.out                # name standard out files and include job ID (%A)

module load gcc/12.2.0
module load arcc/1.0
module load python/3.10.6
module load mafft
module load jdk
module load iq-tree





Last login: Fri Jun  7 11:52:39 on ttys000
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % ls
README.md
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % vim code.sbatch
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % ls
README.md
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % vim code.bash



















(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % mv code.bash example_code.bash
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % ls
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % 
vim official_code.bash
(base) ben@Benjamins-MacBook-Pro Phylogenetic_Comparative_Methods % 
vim example_code.bash 





#       The following code was ran on a HPCC, although with proper
#       set up one could do run the code on their local device.

#       Sequences were collected from Uniprot.org via seach terms.
#        Files were manually Qa/Qc ensuring sequence IDs were
#        correct for the protein of interest. The following code
#        is referencing a generalizable file of Cleaned_protein_sequences.fasta

#### Sequence Alignment :
#       For the sequence alignment we use mafft to align the cleaned
#        fasta file, and read the results to the
#        Aligned_protein_sequences.aln

mafft --auto --thread 6 --preservecase psbA.fasta > psbA.aln
mafft --auto --thread 6 --preservecase psbB.fasta > psbB.aln
mafft --auto --thread 6 --preservecase psbC.fasta > psbC.aln
mafft --auto --thread 6 --preservecase psbD.fasta > psbD.aln
mafft --auto --thread 6 --preservecase psbO.fasta > psbO.aln
mafft --auto --thread 6 --preservecase psbS.fasta > psbS.aln


#### Quality control of sequence alignment :
#        With the aligned sequences you will run phyutility at a
#         certain threshold to remove area sthat have less than 80%
#         alignment. The threshold could be altered according to
#         your interests. In this you will call the program from
#         wherever you have it stored (phyuility/phyutility.jar),
#         set a threshold (0.8), input file, and output file.

java -jar phyutility/phyutility.jar -clean 0.8 -in psbA.aln -out cleaned80_psbA.aln
java -jar phyutility/phyutility.jar -clean 0.8 -in psbB.aln -out cleaned80_psbB.aln
java -jar phyutility/phyutility.jar -clean 0.8 -in psbC.aln -out cleaned80_psbC.aln
java -jar phyutility/phyutility.jar -clean 0.8 -in psbD.aln -out cleaned80_psbD.aln
java -jar phyutility/phyutility.jar -clean 0.8 -in psbO.aln -out cleaned80_psbO.aln
java -jar phyutility/phyutility.jar -clean 0.8 -in psbS.aln -out cleaned80_psbS.aln



#### Constructing Phylogenetic trees :
#       We use iqtree is used here to construct the phylogenetic tree.
#       -s is used to determine if trees should be constructed as single or concatinated trees. Here we construct single gene trees.
#	-m is the type of tree model to be used. In this case we use the modle selection process (MFP) to find the best possible model.
#       It is ran for -bb 1000, or 1000 bootstrap replicates
#       and then we assign a prefix for the files that iqtree populates

iqtree2 -s cleaned80_protein_alignment.aln -m MFP -bb 1000  --prefix Protein_tree

iqtree2 -s /FILE_PATH/cleaned80_psbA.aln -m MFP -bb 1000  --prefix psbA_boot
iqtree2 -s /FILE_PATH/cleaned80_psbB.aln -m MFP -bb 1000  --prefix psbB_boot
iqtree2 -s /FILE_PATH/cleaned80_psbC.aln -m MFP -bb 1000  --prefix psbC_boot
iqtree2 -s /FILE_PATH/cleaned80_psbD.aln -m MFP -bb 1000  --prefix psbD_boot
iqtree2 -s /FILE_PATH/cleaned80_psbO.aln -m MFP -bb 1000  --prefix psbO_boot
iqtree2 -s /FILE_PATH/cleaned80_psbS.aln -m MFP -bb 1000  --prefix psbS_boot



