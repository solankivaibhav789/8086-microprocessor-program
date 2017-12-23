;bcd to binary
;21
;unpack using shift right 4 time
;one have 2 and muliply that by position(10) =20
;other have 1
;add them  21=>15
.model small
.stack 64h
.data
    a db 21h
    res db 00h
    ten db 10

.code
mov ax,@data
mov ds,ax

    mov al,a
    shr al,04
    mul ten
    mov bl,al
    mov al,a
    and al,0fh
    add al,bl
    mov res,al

mov ax,4c00h
int 21h
end
