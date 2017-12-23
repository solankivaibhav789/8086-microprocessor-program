;wap to copy pattern 5 times
.model small
.data
    str1 db '**$'
    len1 dw ($-str1)
    str2 db 5*len1 dup(0)
    
.code
    mov ax,@data
    mov ds,ax
    lea si,str1
    lea di,str2
    mov cx,05h
    l1:
       mov dx,cx
       lea si,str1
       mov cx,len1
       l2:
            mov ax,[si]
            mov [di],ax
            inc si
            inc di
       loop l2:
       mov cx,dx
    loop l1 
mov ax,4c00h
int 21h