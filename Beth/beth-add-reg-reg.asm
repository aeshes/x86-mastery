format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable
  fmt db '%d', 0

section '.code' code executable readable
start:
  mov eax, 10
  mov ecx, 15
  db 03h, 11000001b ; add eax, ecx

  push eax
  push fmt
  call [printf]
  add esp, 8

  push 2000
  call [Sleep]
  add esp, 4

  invoke ExitProcess, 0

section '.idata' import readable writeable
  library kernel32, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
  import kernel32, ExitProcess, 'ExitProcess',\
                   Sleep, 'Sleep'
  import msvcrt, printf, 'printf'