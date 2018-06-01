ln -s /data6/RNA-Seq_betacaroteno_hoja/assembly/G*gtf .
ln -s /data6/RNA-Seq_betacaroteno/assembly/G*gtf .
ls G*gtf> list_gtf.txt
/data6/RNA-Seq_betacaroteno/software/stringtie-1.3.3b.Linux_x86_64/stringtie --merge -p 8 -G /data1/Reference/ReferenceGenome_6.1/annotation/Mesculenta_305_v6.1.gene_exons.gff3 -o betamerged_hoja_raiz.gtf ./list_gtf.txt
/data6/RNA-Seq_betacaroteno/software/cufflinks-2.2.1.Linux_x86_64/gffread ./betamerged_hoja_raiz.gtf -g /data6/RNA-Seq_betacaroteno/reference/Mesculenta_305_v6.fa -w ./betamerged_hoja_raiz.fa