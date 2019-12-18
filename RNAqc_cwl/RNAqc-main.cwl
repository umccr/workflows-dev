#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

label: A cwl representation of our current QC steps in the main WTS samples analysis workflow

inputs:
  fastqc-bam: File
  algorithm-qualimap: String
  qualimap-bam: File
  sequencing-protocol: String
  annotation-file: File
  samtools-bam: File

steps:
  fastqc:
    run: ./tools/fastqc.cwl
    in:
      fastqcBAM: fastqc-bam
    out:
      - fastqcLog
      - zippedFile
      - fastqcReport

  qualimap:
    run: ./tools/qualimap.cwl
    in:
      algorithm: algorithm-qualimap
      qualimapBAM: algorithm-qualimap
      sequencingProtocol: sequencing-protocol
      annotationFile: annotation-file
    out:
      - qualimapLog
      [qualimapReport]

  samtoolsidx:
    run: ./tools/samtoolsqc.cwl
    in:
      samtoolsBAM: samtools-bam 
    out:
      - samtoolsLog     
      - samtoolsidxstatsReport

outputs:
  fastqc-zippedFile:
    type: File
    outputSource: fatsqc/zippedFile
  fastqc-report:
    type: Directory
    outputSource: fastqc/fastqcReport 
  qualimap-report:
    type: array
      items:
        type: array
        items: [File, Directory]
    outputSource: qualimap/qualimapReport
  samtools-log:
    type: File
    outputSource: samtoolsidx/samtoolsLog
  samtoolsidxstats-report:
    type: Directory
    outputSource: samtoolsidx/samtoolsidxstatsReport
  