;max from array from unsigned number--> ja,jb etc
.model small
.data
arr1 dw 01h,02h,09h,05h,06h
n equ 05
res dw 0000h
.code 
main proc near
    mov ax,@data
    mov ds,ax
    lea si,arr1
    mov cl,n
    mov ch,00h
    dec cl
    mov ax,[si]
    l1:
    add si,02h
    cmp ax,[si]
    ja skip
    mov ax,[si]
    skip:
    loop l1
    mov res,ax
    div [10h],20h
    mov ah,04ch
    int 21h
    main endp
end main
    