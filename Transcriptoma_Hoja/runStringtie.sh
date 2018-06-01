#Stringtie

WD=/data6/RNA-Seq_betacaroteno_hoja
REFgff=/data1/Reference/ReferenceGenome_6.1/annotation/Mesculenta_305_v6.1.gene_exons.gff3
REF=/data6/RNA-Seq_betacaroteno/reference/Mesculenta_305_v6.fa
Stringtie=/data6/RNA-Seq_betacaroteno/software/stringtie-1.3.3b.Linux_x86_64
Cufflinks=/data6/RNA-Seq_betacaroteno/software/cufflinks-2.2.1.Linux_x86_64
list='GM3736-29-Planta-1_L1 GM3736-29-Planta-1_L2 GM3736-29-Planta-2_L1 GM3736-29-Planta-2_L2 GM3736-29-Planta-3_L1 GM3736-29-Planta-3_L2 GM3736-2-Planta-1_L1 GM3736-2-Planta-1_L2 GM3736-2-Planta-2_L1 GM3736-2-Planta-2_L2 GM3736-2-Planta-3_L1 GM3736-2-Planta-3_L2 GM3736-44-Planta-1_L1 GM3736-44-Planta-1_L2 GM3736-44-Planta-2_L1 GM3736-44-Planta-2_L2 GM3736-44-Planta-2_L3 GM3736-44-Planta-3_L1 GM3736-44-Planta-3_L2 GM3736-50-Planta-1_L1 GM3736-50-Planta-1_L2 GM3736-50-Planta-2_L1 GM3736-50-Planta-2_L2 GM3736-50-Planta-3_L1 GM3736-50-Planta-3_L2 GM37369-71-Planta-1_L1 GM37369-71-Planta-1_L2 GM37369-78-Planta-1_L1 GM37369-78-Planta-1_L2 GM37369-78-Planta-2_L1 GM37369-78-Planta-2_L2 GM37369-78-Planta-3_L1 GM37369-78-Planta-3_L2 GM905-57-Planta-1_L1 GM905-57-Planta-1_L2 GM905-57-Planta-2_L1 GM905-57-Planta-2_L2 GM905-57-Planta-3_L1 GM905-57-Planta-3_L2 GM905-60-Planta-1_L1 GM905-60-Planta-1_L2 GM905-60-Planta-2_L1 GM905-60-Planta-2_L2 GM905-60-Planta-3_L1 GM905-60-Planta-3_L2'

# Obtain a gtf with the transcript positions for every sample

for sample in ${list}
do

  ${Stringtie}/stringtie -p 8 -G ${REFgff} -o ${sample}.gtf -l ${sample} ${WD}/mapping/${sample}.bam

  echo ${sample}.gtf >> mergelist.txt

done

# Combine the individual gtf files in a single gtf containing transcripts for all samples

${Stringtie}/stringtie --merge -p 8 -G ${REFgff} -o ./stringtie_BetaHojamerged.gtf ./mergelist.txt

# Produce a fasta file from the reference genome. The fasta file will contain the sequence for the assembled transcripts 

${Cufflinks}/gffread ./stringtie_BetaHojamerged.gtf -g ${REF} -w ./stringtie_BetaHojamerged.fa
