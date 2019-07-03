use16

xor ax, ax  ; 31C0h

; xor ax, ax
; opcode 001100, d=0, w=1
db 00110001b, 11000000b
; xor ax, ax
; opcode 001100, d=1, w=1 - different opcode
db 00110011b, 11000000b ; with the same meaning