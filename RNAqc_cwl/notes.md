## Bcbio commandline for qc steps:

The commandline tools, parameters and input/ouptut example files are as follows:

- **fastqc** 
 ```
  -d /work/qc/MDX190058_10293586B_RNA/bcbiotx/tmpnya3148v 
  -t 28 
  --extract 
  -o /work/qc/MDX190058_10293586B_RNA/bcbiotx/tmpnya3148v 
  -f bam /g/data3/gx8/projects/Kanwal_WTS_Processing/2019-06-11_Patient_WTS/2019-06-11_Patient_WTS-merged/work/qc/MDX190058_10293586B_RNA/MDX190058_10293586B_RNA-downsample.bam
```

- **qualimap** rnaseq 
```
	-outdir /work/bcbiotx/tmp9tpu2rqv/MDX190058_10293586B_RNA 
	-a proportional 
	-bam /work/align/MDX190058_10293586B_RNA/MDX190058_10293586B_RNA_star/MDX190058_10293586B_RNA.bam 
	-p non-strand-specific 
	--paired 
	-gtf /g/data3/gx8/local/production/bcbio/genomes/Hsapiens/GRCh37/rnaseq/ref-transcripts.gtf
```

- **samtools** idxstats 
  ```
  /work/align/MDX190058_10293586B_RNA/MDX190058_10293586B_RNA_star/MDX190058_10293586B_RNA.bam > 
  /work/bcbiotx/tmpr1exjnpq/MDX190058_10293586B_RNA-idxstats.txt
  ```
