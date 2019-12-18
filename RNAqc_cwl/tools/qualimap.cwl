#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: CWL tool representation of qualimap - a bioinformatics tools to facilitate the quality control of alignment sequencing data http://qualimap.bioinfo.cipf.es/doc_html/intro.html

hints:
  DockerRequirement:
    dockerPull: maxulysse/qualimap

inputs:
  algorithm:
    type: String
    inputBinding:
      position: 1
      prefix: -a
  qualimapBAM:
    type: File
    inputBinding:
      position: 2
      prefix: -bam
  sequencingProtocol:
    type: String
    inputBinding:
      position: 3
      prefix: -p
  annotationFile:
    type: File
    inputBinding:
      position: 4
      prefix: --gtf 

arguments: ["--paired"]      

outputs:
  qualimapLog:
    type: stdout
  qualimapReport:
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*"

stdout: "qualimap.log"

baseCommand: ["qualimap", "rnaseq"]