format PE console
entry start

include 'win32a.inc'

section '.code' code executable readable
start:
  db 0B8h ; mov eax, 1
  dd 17   ; 32-bit integer 17