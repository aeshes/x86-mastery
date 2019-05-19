format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable
  fmt db '%d', 0

section '.code' code executable readable
start:
  db 8Bh, 00000101b
  dd fmt
  invoke ExitProcess, 0

section '.idata' import readable writeable
  library kernel32, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
  import kernel32, ExitProcess, 'ExitProcess',\
                   Sleep, 'Sleep'
  import msvcrt, printf, 'printf'