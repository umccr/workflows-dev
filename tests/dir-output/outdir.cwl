cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: python:alpine3.11


baseCommand: [python]
arguments: [$(inputs.script.path), $(inputs.outdir)]

inputs:
  script: File
  outdir: string

outputs:
  mydir:
    type: Directory
    outputBinding:
      glob: "$(inputs.outdir)"
