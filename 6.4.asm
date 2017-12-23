;last 1st occurence of char in str
.model small

.data
ary db 'vaibhav$'
len db $-ary
key db 'a'
ocur db 00h
res dw 00h


.code 
mov ax,@data
mov ds,ax

mov si,00h
mov cl,len

for:
mov bl,ary[si] 
cmp key,bl
jne skip
;inc ocur
mov res,si

skip:
inc si
loop for

mov dx,OFFSET ary
mov ah,09h
int 21h

mov ax,4c00h
int 21h
end 