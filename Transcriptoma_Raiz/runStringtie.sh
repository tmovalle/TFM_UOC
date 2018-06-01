#Stringtie

WD=/data6/RNA-Seq_betacaroteno
REF=/data1/Reference/ReferenceGenome_6.1/annotation/Mesculenta_305_v6.1.gene_exons.gff3
Stringtie=/data6/RNA-Seq_betacaroteno/software/stringtie-1.3.3b.Linux_x86_64
list="GM3736-29Planta1-1"
#'GM3736-29Planta2-1 GM3736-29Planta3-1 GM3736-2Planta1-1 GM3736-2Planta2-1 GM3736-2Planta3-1 GM3736-44Planta1-1 GM3736-44Planta2-1 GM3736-44Planta3-1 GM3736-50Planta1-1 GM3736-50Planta2-1 GM3736-50Planta3-1 GM3736-71Planta1Muest1-1 GM3736-71Planta1Muest2-1 GM3736-71Planta1Muest3-2 GM3736-78Planta1-1 GM3736-78Planta2-1 GM3736-78Planta3-1 GM905-57Planta1-1 GM905-57Planta2-1 GM905-57Planta3-1 GM905-60Planta1-2 GM905-60Planta2-2 GM905-60Planta3-1'

for sample in ${list}
do
${Stringtie}/stringtie -p 8 -G ${REF} -o ${sample}.gtf -l ${sample} ${WD}/mapping/${sample}.bam

done
