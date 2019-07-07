format PE

section '.text' readable executable
  ; inc eax, 40+ rd, INC r32
  db 40h

  ; inc [eax], FF /0, INC r/m32
  ; FFh(Opcode), 00(Mod)-000(Reg=/0)-000(R/M=[EAX])
  db 0FFh, 00000000b

  ; inc eax
  ; FFh(Opcode), 11(Mod)-000(Reg=/0)-000(R/M=EAX)
  db 0FFh, 11000000b