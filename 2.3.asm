;multiplication of array with number array work full number
.model small
.stack 64h
.data
arr1 db 12h,34h,45h,74h             ;number is 52 43 31 22
len db ($-arr1)
mr db 04h
arr2 db 5 dup(0)

.code
mov ax,@data
mov ds,ax
lea si,arr1 + 4          ;add si with 1 x no of byte
lea di,arr2 + 5
mov cx,05h

mov bh,00h
agian:
mov al,[si]
mul mr
add al,bh
mov [di],al
dec si
dec di
mov bh,ah                ;bh for take care about carry of each muliply
loop agian
mov [di],bh


mov ax,4c00h
int 21h
end