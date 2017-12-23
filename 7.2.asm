;wap to ascii subtration
;array1 31 31 31
;array2 32 32 32
;or
;array1 '1' '1' '1'
;array2 '2' '2' '2'
;addition 31 + 32 = 63 but answer should be '3'
.model small
.data
    arr1 db '3','4','5','6'
    arr2 db '1','3','6','3'
    arr3 db 5 dup(0)
.code
mov ax,@data
mov ds,ax
    mov si,0003h
    mov di,0003h
    mov bx,0004h
    mov cx,04h
    agian:
        mov al,arr1[si]
        sbb al,arr2[di]
        aas
        mov ah,00h
        mov arr3[bx],al
        dec si
        dec di
        dec bx
    loop agian
mov ax,4c00h
int 21h
 