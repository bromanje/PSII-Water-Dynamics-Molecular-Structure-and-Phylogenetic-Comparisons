
### For this work you will need to have the following programs
#	 downloaded or present in your environment to run the
#	 following code:
#	   mafft (https://www.ebi.ac.uk/jdispatcher/msa/mafft)
#	   phyutility (https://github.com/blackrim/phyutility)
#	   iqtree (http://www.iqtree.org/)
#	The following code was ran on a HPCC, although with proper 
#	set up one could do run the code on their local device.

#	Sequences were collected from Uniprot.org via seach terms. 
#	 Files were manually Qa/Qc ensuring sequence IDs were 
#	 correct for the protein of interest. The following code
#	 is referencing a generalizable file of Cleaned_protein_sequences.fasta

#### Sequence Alignment : 
#	For the sequence alignment we use mafft to align the cleaned
#	 fasta file, and read the results to the
#	 Aligned_protein_sequences.aln

mafft --auto --thread 6 --preservecase Cleaned_protein_sequences.fasta > Aligned_protein_sequences.aln 

#### Quality control of sequence alignment :
#	 With the aligned sequences you will run phyutility at a
#	  certain threshold to remove area sthat have less than 80%
#	  alignment. The threshold could be altered according to 
#	  your interests. In this you will call the program from 
#	  wherever you have it stored (phyuility/phyutility.jar), 
#	  set a threshold (0.8), input file, and output file.

java -jar phyutility/phyutility.jar -clean 0.8 -in Aligned_protein_sequence.aln -out cleaned80_protein_alignment.aln 


#### Constructing Phylogenetic trees : 
#	We use iqtree is used here to construct the phylogenetic tree. 
#	The cleaned alignment file is called
	# -m the type of model used is determine, In this case we use the built in find the best model call (MFP), 
#	It is ran for -bb 1000, or 1000 bootstrap replicates
#	and then we assign a prefix for the files that iqtree populates

iqtree2 -s cleaned80_protein_alignment.aln -m MFP -bb 1000  --prefix Protein_tree

