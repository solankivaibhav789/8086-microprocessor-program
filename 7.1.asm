;wap to ascii addtion
;array1 31 31 31
;array2 32 32 32
;or
;array1 '1' '1' '1'
;array2 '2' '2' '2'
;addition 31 + 32 = 63 but answer should be '3'
;63 store as ah=6 and al=3
;ah is become 0
;aaa do this only---------> if al>9 or auxilary flag=1 than al add 6 and ah is increment
.model small
.data
    arr1 db '5','2','3','4'
    arr2 db '7','2','3','5'
    arr3 db 5 dup(0)
.code
mov ax,@data
mov ds,ax
    mov si,0003h  ;start with last position
    mov di,0003h
    mov bx,0004h
    
    mov cx,04h
    agian:
        mov al,arr1[si]
        adc al,arr2[di]
        aaa
        mov ah,00h
        mov arr3[bx],al
        dec si
        dec di
        dec bx
    loop agian
    jnc skip
    mov arr3[bx],1
    skip:
mov ax,4c00h
int 21h
 