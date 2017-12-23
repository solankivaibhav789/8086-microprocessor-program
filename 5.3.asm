;reverse the given string in  the same string
.model small
.data
 str1 db 'msubdigital$'
 length db 00 
.code
    main proc near   
        mov ax,@data
        mov ds,ax
        mov es,ax
        lea si,str1
        lea di,str1
        
        
        loop1: cmp [si],'$'
                je skip
                inc length
                inc si
                loop loop1
        skip: 
             mov bx,0000h
             lea si,str1
             mov al,length
             mov ah,00h
             add di,ax
             dec di
             mov al,length
             mov ah,00h
             shr ax,01h
             mov length,al
             
             mov cl,length
             mov ch,00h
        
        loop2:  cld
                lodsb
                mov bl,[di]
                std
                stosb
                dec si
                mov [si],bl
                inc si
              loop loop2
                
                 mov ah,4ch
                 int 21h
                 main endp
                 end main