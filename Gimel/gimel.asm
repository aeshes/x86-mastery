format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable
  fmt db '%d', 0

section '.code' code executable readable
start:
  ; mov eax, [fmt]
  db 8Bh, 00000101b
  dd fmt

  ; mov eax, [edx]
  ; 8Bh (Opcode)  00(Mod)-000(Reg=EAX)-010(R/M=[EDX])
  db 8Bh, 00000010b

  ; mov esi, [fmt]
  ; 8B (Opcode) 00(Mod)-110(Reg=ESI)-101(R/M=Mem)
  db 8Bh, 00110101b
  dd fmt

  ; mov eax, [ebp]
  db 8Bh, 01000101b, 0 ; 8Bh (Opcode)
                       ; 01(Mod)-000(Reg=EAX)-101(R/M=[EBP+offset])
                       ; 0 (8-bit  offset)

  ; add eax, [ebx + 100000h]
  db 03h, 10000011b ; 03h (Opcode)
                    ; 10(Mod)-000(Reg=EAX)-011(R/M=[EBX+offset])
  dd 100000h        ; 32-bit offset
  invoke ExitProcess, 0

section '.idata' import readable writeable
  library kernel32, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
  import kernel32, ExitProcess, 'ExitProcess',\
                   Sleep, 'Sleep'
  import msvcrt, printf, 'printf'