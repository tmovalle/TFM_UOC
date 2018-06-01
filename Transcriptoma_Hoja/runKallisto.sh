#!/bin/bash

workDir=/data6/RNA-Seq_betacaroteno_hoja/quantification

cd ${workDir}
list='GM3736-29-Planta-1_L1 GM3736-29-Planta-1_L2 GM3736-29-Planta-2_L1 GM3736-29-Planta-2_L2 GM3736-29-Planta-3_L1 GM3736-29-Planta-3_L2 GM3736-2-Planta-1_L1 GM3736-2-Planta-1_L2 GM3736-2-Planta-2_L1 GM3736-2-Planta-2_L2 GM3736-2-Planta-3_L1 GM3736-2-Planta-3_L2 GM3736-44-Planta-1_L1 GM3736-44-Planta-1_L2 GM3736-44-Planta-2_L1 GM3736-44-Planta-2_L2 GM3736-44-Planta-2_L3 GM3736-44-Planta-3_L1 GM3736-44-Planta-3_L2 GM3736-50-Planta-1_L1 GM3736-50-Planta-1_L2 GM3736-50-Planta-2_L1 GM3736-50-Planta-2_L2 GM3736-50-Planta-3_L1 GM3736-50-Planta-3_L2 GM37369-71-Planta-1_L1 GM37369-71-Planta-1_L2 GM37369-78-Planta-1_L1 GM37369-78-Planta-1_L2 GM37369-78-Planta-2_L1 GM37369-78-Planta-2_L2 GM37369-78-Planta-3_L1 GM37369-78-Planta-3_L2 GM905-57-Planta-1_L1 GM905-57-Planta-1_L2 GM905-57-Planta-2_L1 GM905-57-Planta-2_L2 GM905-57-Planta-3_L1 GM905-57-Planta-3_L2 GM905-60-Planta-1_L1 GM905-60-Planta-1_L2 GM905-60-Planta-2_L1 GM905-60-Planta-2_L2 GM905-60-Planta-3_L1 GM905-60-Planta-3_L2'

REF=/data6/RNA-Seq_betacaroteno_hoja/assembly/stringtie_BetaHojamerged.fa
kallistoExe=/data6/RNA-Seq_betacaroteno/software/kallisto_linux-v0.43.1/kallisto


${kallistoExe} index --make-unique -i stringtie_Betamerged_sequence.idx ${REF}

for sample in ${list}
do

time ${kallistoExe} quant -i stringtie_Betamerged_sequence.idx -b 100 -o ${sample} -t 8 ../reads/${sample}_1.fq.gz ../reads/${sample}_2.fq.gz

done

