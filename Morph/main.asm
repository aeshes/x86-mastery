use16

;
; ----- XOR -----
;
xor ax, ax  ; 31C0h, 33C0h

; xor ax, ax
; opcode 001100, d=0, w=1
db 00110001b, 11000000b
; xor ax, ax
; opcode 001100, d=1, w=1 - different opcode
db 00110011b, 11000000b ; with the same meaning

;
; ----- ADD -----
;
add ax, ax  ; 01C0h, 03C0h

; OP =000000, d =0, w=1, ModRM = 1100000000b
db 00000001b, 11000000b
; d = 1
db 00000011b, 11000000b

;
; ----- SUB -----
;
sub ax, ax  ; 29C0h, 2BC0h
db 00101001b, 11000000b
db 00101011b, 11000000b

;
; ----- AND  -----
;
and ax, ax  ; 21C0h, 23C0h
db 00100001b, 11000000b
db 00100011b, 11000000b

;
; ----- OR -----
;
or ax, ax  ; 09C0h
db 0001001b, 11000000b
db 0001011b, 11000000b

; ----- MOV -----
mov ax, ax
db 10001001b, 11000000b
db 10001011b, 11000000b

; ----- MOV reg, imm -----
mov ax, 0
db 10111000b, 11000000b, 0
