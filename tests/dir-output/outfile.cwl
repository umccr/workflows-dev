class: CommandLineTool
cwlVersion: v1.1

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
    - '$({class: "Directory", basename: inputs.outputdir, listing: []})'
    
#baseCommand: ls
baseCommand: touch
arguments:
  - $(inputs.outputdir)/test.file

inputs: 
  outputdir: string

outputs:
  out:
    type: Directory
    outputBinding:
      glob: $(inputs.outputdir)

