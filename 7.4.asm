;Write a program for ascii division. 
;12469/3=4156
.model small
.data
num1 db '1','2','4','6','9'
num2 db 03h 
n equ 05
res db 05 dup(0)
num db 0ah
.code
    main proc near
        mov ax,@data
        mov ds,ax
        lea si,num1
        lea bx,res
        mov cl,04h
        mov ch,00h
        mov dx,0000h
        mov ax,0000h
        mov ah,[si]     ;ah contain higher byte 
        and ah,0fh      ;convert ascii into bcd
        Loop1: 
               inc si
               mov al,[si]   ;al contain lower byte
               and al,0fh    ;convert ascii into bcd
                             ;now ax=01 02
               aad           ;apply aad
               div num2      ;now 12/03==>reminder=ah=00h and quotient=al=04h
               mov [bx],al   ;al trnasfer to res [bx]
               inc bx        ;ah contain higher byte and now we want lower byte al so after loop we get that
                          
        loop loop1
             
        mov ah,4ch
        int 21h
        main endp
    end main
              
        
