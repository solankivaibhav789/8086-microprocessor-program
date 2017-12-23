;wap for finding number of accurace of substring in string.
.model small
.data
    str1 db 'aabaavvaacbababababa'
    len1 dw ($-str1)
    str2 db 'ba'
    len2 dw ($-str2)
    counter dw 00h
    mem dw 00h
.code
mov ax,@data
mov ds,ax
mov es,ax
    mov ax,len1
    sub ax,len2
    mov cx,ax          ;cx=no of comparisions and comparision = string length - substring length
    inc cx
    mov dx,len2
    lea si,str1
    lea di,str2
    mov mem,si          ;mem for taken care of si,every time si increment by one
    l1:
    mov dx,cx
    lea di,str2
    mov si,mem
    mov cx,len2
        l2:
        mov ax,[si]         ;inner loop also increment si so after this loop inc mem than mov si,mem
        mov bx,[di]
        cmp al,bl
        jnz skip
        inc si
        inc di
        loop l2
        
        inc counter
        
        skip:
    mov cx,dx
    inc mem
    loop l1    
    
mov ax,4c00h
int 21h