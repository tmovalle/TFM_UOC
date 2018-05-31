

WD=/data6/RNA-Seq_betacaroteno
hisat=/data6/RNA-Seq_betacaroteno/software/hisat2-2.1.0
REF=/data6/RNA-Seq_betacaroteno/reference/Mesculenta_305_v6.fa
# list='GM3736-29Planta2-1 GM3736-29Planta3-1 GM3736-2Planta1-1 GM3736-2Planta2-1 GM3736-2Planta3-1 GM3736-44Planta1-1 GM3736-44Planta2-1 GM3736-44Planta3-1 GM3736-50Planta1-1 GM3736-50Planta2-1 GM3736-50Planta3-1 GM3736-71Planta1Muest1-1 GM3736-71Planta1Muest2-1 GM3736-71Planta1Muest3-2 GM3736-78Planta1-1 GM3736-78Planta2-1 GM3736-78Planta3-1 GM905-57Planta1-1 GM905-57Planta2-1 GM905-57Planta3-1 GM905-60Planta1-2 GM905-60Planta2-2 GM905-60Planta3-1 GM3736-29Planta1-1'
list='GM3736-29Planta1-1'

# ${hisat}/hisat2-build ${REF} ${REF}

for sample in ${list}
do

${hisat}/hisat2 -p 8 --rg-id ${sample} --rg SM:${sample} --rg PL:ILLUMINA --max-intronlen 17500 -t --dta -x ${REF} -1 ${WD}/reads/${sample}_1.fq.gz -2 ${WD}/reads/${sample}_2.fq.gz -S ${sample}.sam

samtools sort -@ 8 -o ${sample}.bam ${sample}.sam

done

rm *sam