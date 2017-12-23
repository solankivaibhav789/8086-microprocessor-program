;ascii division by user input

.model small

.data
ar1 db 5,?,5 dup(0)
ar2 db 5,?,5 dup(0)
in2 db 2
ar3 db 6,?,6 dup(0)
str1 db 'Enter first ascii:$'
str2 db 'Enter second ascii:$'
n db ($-ar2)
temp db 00h
a db 00h

.code
    newLine macro
    
    mov dl,13
    mov ah,02h
    int 21h
    
    mov dl,10
    mov ah,02h
    int 21h
endm   
    main proc near
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,09h
    int 21h
    
    lea dx,ar1
    mov ah,0ah
    int 21h
        
        newLine
        
    lea dx,str2
    mov ah,09h
    int 21h
    
    lea dx,ar2
    mov ah,0ah
    int 21h 
        
        newLine
        
    mov si,04h
    mov cx,03h
    
l1: mov al,ar1[si]
    and al,0fh
    mov bl,in2
    and bl,0fh
    div bl
    mov dl,00h
    aad
    
    ;mov dl,ah
    ;add al,temp
    ;aaa
    ;mov dl,ah
    ;mov temp,dl
    mov ar3[si+1],al
   
    dec si
   
    loop l1
    mov ar3[si+1],ah
    
    mov al,30h
    adc al,00h 
    mov ar3[si+1],al    
    
    mov si,05h
    mov cx,03h
l2: mov al,ar3[si]
    add al,30h
    mov ar3[si],al
    dec si
    loop l2
    
    lea dx,ar3
    mov ah,09h
    int 21h
             
    mov ah,04ch
    int 21h
    main endp
    end main        