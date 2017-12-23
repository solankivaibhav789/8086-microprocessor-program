;find occurence of char in str
.model small

.data
ary db 'This is Jeet$'
len db $-ary
key db 'e'
ocur db 00h


.code 
mov ax,@data
mov ds,ax

mov si,00h
mov cl,len

for:
mov bl,ary[si] 
cmp key,bl
jnz skip
inc ocur
skip:
inc si
loop for

mov dx,OFFSET ary
mov ah,09h
int 21h

mov ax,4c00h
int 21h
end 