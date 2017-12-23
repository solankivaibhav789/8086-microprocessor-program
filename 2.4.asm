;Write a program to devide n-byte array withgiven number. 

.model small
.data
num1 db 12h,24h,45h,45h,60h
num2 db 03h 
n equ 05
res db 06 dup(0)
.code
    main proc near
        mov ax,@data
        mov ds,ax
        lea si,num1
        lea bx,res
        mov cl,n
        mov ch,00h
        mov dl,00h
        mov ax,n
        add bx,ax
        sub ax,01h
        add si,ax
        loop1: mov al,[si]
              div num2
              add al,dl 
              jnc skip
              inc ah
              
             skip:mov [bx],al
             mov dl,ah
             dec bx
             dec si
          loop loop1
          
            mov [bx],dl
            mov res,bl
             
        mov ah,4ch
        int 21h
        main endp
    end main
              
        