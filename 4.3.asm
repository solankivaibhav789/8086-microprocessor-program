;wap to bcd to binary 16 bit
.model small

.data

data1 dw 9099h
res dw 00h


.code


mov ax,@data
mov ds,ax


mov bx,data1

mov ax,data1
and ax,000fh
add res,ax

mov ax,bx
and ax,00f0h
shr ax,4
mov cx,0ah
mul cx
add res,ax


mov ax,bx
and ax,0f00h
shr ax,8
mov cx,64h
mul cx
add res,ax


mov ax,bx
and ax,0f000h
shr ax,12
mov cx,1000
mul cx
add res,ax


