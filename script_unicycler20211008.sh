#!/bin/bash

# sauvegarde le ficher ci dessous dans le répertoire 9508B, nommé script.sh
# déplace toi dans le répertoire 9508B dans le terminal cd .....
# chmod +x script.sh
# ./script.sh

short1=(
	./raw_reads/FE9508BPD/FE9508BPD_MER-2021-007776_trimmed_R1_fastq.gz
	./raw_reads/FE9508BPB/FE9508BPB_MER-2021-007777_trimmed_R1_fastq.gz
	./raw_reads/FE9508B/FE9508B_MER-2021-007781_trimmed_R1_fastq.gz
)

short2=(
	./raw_reads/FE9508BPD/FE9508BPD_MER-2021-007776_trimmed_R2_fastq.gz
	./raw_reads/FE9508BPB/FE9508BPB_MER-2021-007777_trimmed_R2_fastq.gz
	./raw_reads/FE9508B/FE9508B_MER-2021-007781_trimmed_R2_fastq.gz
)

out=(
	./raw_reads/FE9508BPD/FE9508BPD_MER-2021-00776_trimmed_unicycler_assembly_PE
	./raw_reads/FE9508BPB/FE9508BPB_MER-2021-00777_trimmed_unicycler_assembly_PE
	./raw_reads/FE9508B/FE9508B_MER-2021-007781_trimmed_unicycler_assembly_PE
)

for i in ${!short1[@]}
do
	unicycler \
		--short1 "${short1[$i]}" \
		--short2 "${short2[$i]}" \
		--out "${out[$i]}" \
		--mode normal -t5 \
    --min_fasta_length 1000
    
    done
