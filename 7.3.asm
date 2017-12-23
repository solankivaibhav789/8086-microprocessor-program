;-----------------multiplication----------------------;
;muliplication is not possible into ascii value
;so first convert it into unback bcd
;than muliply
; use aam
;also need to use aaa

.model small
.data
    arr1 db '3','4','5','6'
    arr2 db '9'
    arr3 db 5 dup(0)
.code
mov ax,@data
mov ds,ax
    mov si,0003h
    mov di,0000h
    mov bx,0004h
    mov cx,04h
    mov ah,00h
    agian:
        mov al,arr1[si]
        mov dl,arr2[di]
        and al,0fh
        and dl,0fh
        mul dl 
        aam
        
        add al,ah
        aaa
        mov arr3[bx],al
        dec si
        dec bx
    loop agian
    mov arr3[bx],ah
mov ax,4c00h
int 21h
 