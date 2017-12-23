;ascii addition ,subtration ,multiplicatin,division
;packed bcd- 23 but store as 2 and 3 its called packed because it store in 8 bit. 2 in 4 bit and 3 in 4 bit
;unpacked 23 than is store as 02 in first byte and 03 in second byte

;wap to unpacked a bcd number
;defind word ax=1234 as packed bcd ah=12 and al=34
;than take array of 4 byte
;division method-1234/1000 al=qutiant and ds=reminder al store in some byte
;again do 234/100 and do same thing 
;second method is that al=1234, AND with al=f000h store in array
 
.model small
.data
    num dd 1234h
    arr db 4 dup(0)
.code
mov ax,@data
mov ds,ax
   mov ax,num
   lea si,arr
    
   mov bx,1000h
   mov dx,0000h
   div bx
   mov [si],al
   mov ax,dx
   inc si
   
   mov bx,100h
   mov dx,0000h
   div bx
   mov [si],al
   mov ax,dx
   inc si
   
   mov bx,10h
   mov dx,0000h
   div bx
   mov [si],al
   mov ax,dx
   inc si
   
   mov [si],ax
   
   

mov ax,4c00h
int 21h