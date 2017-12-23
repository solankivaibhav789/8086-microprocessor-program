;WAP TO FIND MAX NO. FROM GIVEN ARRAY OF SIGN NUMBER

.model small
.data
arr1 dw 1254h,0f264h,9000h,3567h,0a051h
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
jg skip

mov ax,[si]

skip:
loop l1

mov res,ax
mov ah,04ch
int 21h
main endp
end main