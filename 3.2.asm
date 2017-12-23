;sort ary 

.model small
.data
ary db 5,4,3,2,1
len db $-ary
cont db len


.code
mov ax,@data
mov ds,ax

mov si,00h
for1:
    mov si,00h
    mov cl,len
    dec cl
for2:
    mov al,ary[si]
    mov bl,ary[si+1]
    cmp al,bl
    jb skip
    xchg al,ary[si+1]
    mov ary[si],bl
    skip:
    inc si
    loop for2
    
    dec cont
    cmp cont,00h
    jz exit
    jmp for1
    
    
exit:

mov ax,4c00h
int 21h  