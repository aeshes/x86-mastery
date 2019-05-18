format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable
  fmt db '%d', 0

section '.code' code executable readable
start:
  ; base mov opcode = B8h
  db 0B8h, 10, 0, 0, 0 ; mov eax,10
  db 0B9h, 15, 0, 0, 0 ; mov ecx, 15

  ; base add opcode = 03h
  db 03h, 11000001b ; add eax, ecx

  db 50h      ; push eax
  db 68h      ; push число
  dd fmt      ; непосредственно число
  call [printf]
  db 81h, 11000100b ; add esp, 8
  dd 8

  db 68h   ; push число
  dd 2000  ; непосредственно число 2000
  call [Sleep]
  db 81h, 11000100b ; add esp, 4
  dd 4

  invoke ExitProcess, 0

section '.idata' import readable writeable
  library kernel32, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
  import kernel32, ExitProcess, 'ExitProcess',\
                   Sleep, 'Sleep'
  import msvcrt, printf, 'printf'