#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: CWL tool representation of fastqc - a quality control tool for high throughput sequence data https://www.bioinformatics.babraham.ac.uk/projects/fastqc/

hints:
  DockerRequirement:
    dockerPull: biocontainers/fastqc

arguments: ["--format", bam]

inputs:
  fastqcBAM:
    type: File
    inputBinding:
      position: 1

outputs:
  fatsqcLog:
    type: stdout

  zippedFile:
    type: File
    outputBinding:
      glob: '*.zip'

  fastqcReport:
    type: Directory
    outputBinding:
      glob: .

stdout: "fastqc.log"

baseCommand: ["fastqc"]
 


