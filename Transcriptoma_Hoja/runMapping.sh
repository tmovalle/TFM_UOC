

WD=/data6/RNA-Seq_betacaroteno_hoja
hisat=/data6/RNA-Seq_betacaroteno/software/hisat2-2.1.0
REF=/data6/RNA-Seq_betacaroteno/reference/Mesculenta_305_v6.fa
list='GM3736-29-Planta-1_L1 GM3736-29-Planta-1_L2 GM3736-29-Planta-2_L1 GM3736-29-Planta-2_L2 GM3736-29-Planta-3_L1 GM3736-29-Planta-3_L2 GM3736-2-Planta-1_L1 GM3736-2-Planta-1_L2 GM3736-2-Planta-2_L1 GM3736-2-Planta-2_L2 GM3736-2-Planta-3_L1 GM3736-2-Planta-3_L2 GM3736-44-Planta-1_L1 GM3736-44-Planta-1_L2 GM3736-44-Planta-2_L1 GM3736-44-Planta-2_L2 GM3736-44-Planta-2_L3 GM3736-44-Planta-3_L1 GM3736-44-Planta-3_L2 GM3736-50-Planta-1_L1 GM3736-50-Planta-1_L2 GM3736-50-Planta-2_L1 GM3736-50-Planta-2_L2 GM3736-50-Planta-3_L1 GM3736-50-Planta-3_L2 GM37369-71-Planta-1_L1 GM37369-71-Planta-1_L2 GM37369-78-Planta-1_L1 GM37369-78-Planta-1_L2 GM37369-78-Planta-2_L1 GM37369-78-Planta-2_L2 GM37369-78-Planta-3_L1 GM37369-78-Planta-3_L2 GM905-57-Planta-1_L1 GM905-57-Planta-1_L2 GM905-57-Planta-2_L1 GM905-57-Planta-2_L2 GM905-57-Planta-3_L1 GM905-57-Planta-3_L2 GM905-60-Planta-1_L1 GM905-60-Planta-1_L2 GM905-60-Planta-2_L1 GM905-60-Planta-2_L2 GM905-60-Planta-3_L1 GM905-60-Planta-3_L2'


${hisat}/hisat2-build ${REF} ${REF}

for sample in ${list}
do

${hisat}/hisat2 -p 8 --rg-id ${sample} --rg SM:${sample} --rg PL:ILLUMINA --max-intronlen 17500 -t --dta -x ${REF} -1 ${WD}/reads/${sample}_1.fq.gz -2 ${WD}/reads/${sample}_2.fq.gz -S ${sample}.sam

samtools sort -@ 8 -o ${sample}.bam ${sample}.sam

done

rm *sam