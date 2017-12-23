
;find occurence of number
.model small

.data
ary db 1,4,3,4,5
len db $-ary
key db 4
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



mov ax,4c00h
int 21h
end 