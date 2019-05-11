format PE console
entry start

include 'win32a.inc'

section '.code' code executable readable
start:
  db 90h ; nop
  invoke ExitProcess, 0

section '.idata' import data readable writeable
    library kernel32, 'kernel32.dll'
    import kernel32, ExitProcess, 'ExitProcess'