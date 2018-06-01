#!/bin/bash
# Obtener la secuencia de los transcritos a patir de su localización en el genoma de referencia.
# /data6/RNA-Seq_betacaroteno/software/cufflinks-2.2.1.Linux_x86_64/gffread /data6/RNA-Seq_betacaroteno/assembly/stringtie_Betamerged.gtf -g /data6/RNA-Seq_betacaroteno/reference/Mesculenta_305_v6.fa -w /data6/RNA-Seq_betacaroteno/assembly/stringtie_Betamerged_sequence.fa

workDir=/data6/RNA-Seq_betacaroteno/quantification

cd ${workDir}
list="GM3736-29Planta2-1 GM3736-29Planta3-1 GM3736-2Planta1-1 GM3736-2Planta2-1 GM3736-2Planta3-1 GM3736-44Planta1-1 GM3736-44Planta2-1 GM3736-44Planta3-1 GM3736-50Planta1-1 GM3736-50Planta2-1 GM3736-50Planta3-1 GM3736-71Planta1Muest1-1 GM3736-71Planta1Muest2-1 GM3736-71Planta1Muest3-2 GM3736-78Planta1-1 GM3736-78Planta2-1 GM3736-78Planta3-1 GM905-57Planta1-1 GM905-57Planta2-1 GM905-57Planta3-1 GM905-60Planta1-2 GM905-60Planta2-2 GM905-60Planta3-1 GM3736-29Planta1-1"

REF=/data6/RNA-Seq_betacaroteno/assembly/stringtie_Betamerged_sequence.fa
kallistoExe=/data6/RNA-Seq_betacaroteno/software/kallisto_linux-v0.43.1/kallisto


${kallistoExe} index --make-unique -i stringtie_Betamerged_sequence.idx ${REF}

for sample in ${list}
do

time ${kallistoExe} quant -i stringtie_Betamerged_sequence.idx -b 100 -o ${sample} -t 8 ../reads/${sample}_1.fq.gz ../reads/${sample}_2.fq.gz

done

