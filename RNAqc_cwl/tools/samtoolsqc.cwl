#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: CWL tool representation of samtools idxstats command - a quality control tool for reporting alignment summary statistics http://www.htslib.org/doc/samtools-idxstats.1.html

hints:
  DockerRequirement:
    dockerPull: biocontainers/samtools

inputs:
  samtoolsBAM:
    type: File
    inputBinding: 
      position: 1

outputs:
  samtoolsLog:
    type: stdout

  samtoolsidxstatsReport:
    type: Directory
    outputBinding:
      glob: .

stdout: "samtoolsidxstats.txt"

baseCommand: ["samtools", "idxstats"]