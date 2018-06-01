#!/bin/bash

workDir=/data6/RNAseq_Raiz_Hoja/Quantification/

cd ${workDir}
list='GM3736-29-Planta-1_L1 GM3736-29-Planta-1_L2 GM3736-29-Planta-2_L1 GM3736-29-Planta-2_L2 GM3736-29-Planta-3_L1 GM3736-29-Planta-3_L2 GM3736-2-Planta-1_L1 GM3736-2-Planta-1_L2 GM3736-2-Planta-2_L1 GM3736-2-Planta-2_L2 GM3736-2-Planta-3_L1 GM3736-2-Planta-3_L2 GM3736-44-Planta-1_L1 GM3736-44-Planta-1_L2 GM3736-44-Planta-2_L1 GM3736-44-Planta-2_L2 GM3736-44-Planta-2_L3 GM3736-44-Planta-3_L1 GM3736-44-Planta-3_L2 GM3736-50-Planta-1_L1 GM3736-50-Planta-1_L2 GM3736-50-Planta-2_L1 GM3736-50-Planta-2_L2 GM3736-50-Planta-3_L1 GM3736-50-Planta-3_L2 GM37369-71-Planta-1_L1 GM37369-71-Planta-1_L2 GM37369-78-Planta-1_L1 GM37369-78-Planta-1_L2 GM37369-78-Planta-2_L1 GM37369-78-Planta-2_L2 GM37369-78-Planta-3_L1 GM37369-78-Planta-3_L2 GM905-57-Planta-1_L1 GM905-57-Planta-1_L2 GM905-57-Planta-2_L1 GM905-57-Planta-2_L2 GM905-57-Planta-3_L1 GM905-57-Planta-3_L2 GM905-60-Planta-1_L1 GM905-60-Planta-1_L2 GM905-60-Planta-2_L1 GM905-60-Planta-2_L2 GM905-60-Planta-3_L1 GM905-60-Planta-3_L2 GM3736-29Planta2-1 GM3736-29Planta3-1 GM3736-2Planta1-1 GM3736-2Planta2-1 GM3736-2Planta3-1 GM3736-44Planta1-1 GM3736-44Planta2-1 GM3736-44Planta3-1 GM3736-50Planta1-1 GM3736-50Planta2-1 GM3736-50Planta3-1 GM3736-71Planta1Muest1-1 GM3736-71Planta1Muest2-1 GM3736-71Planta1Muest3-2 GM3736-78Planta1-1 GM3736-78Planta2-1 GM3736-78Planta3-1 GM905-57Planta1-1 GM905-57Planta2-1 GM905-57Planta3-1 GM905-60Planta1-2 GM905-60Planta2-2 GM905-60Planta3-1 GM3736-29Planta1-1'

REF=/data6/RNAseq_Raiz_Hoja/Assembly/betamerged_hoja_raiz.fa
kallistoExe=/data6/RNA-Seq_betacaroteno/software/kallisto_linux-v0.43.1/kallisto


${kallistoExe} index --make-unique -i betamerged_hoja_raiz.idx ${REF}

for sample in ${list}
do

time ${kallistoExe} quant -i betamerged_hoja_raiz.idx -b 100 -o ${sample} -t 8 ../Reads/${sample}_1.fq.gz ../Reads/${sample}_2.fq.gz

done

