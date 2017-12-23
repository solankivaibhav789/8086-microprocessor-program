;ascii addition

.model small

.data
ar1 db 5,?,5 dup(0)
ar2 db 5,?,5 dup(0)
ar3 db 6,?,6 dup(0)
str1 db 'Enter first ascii:$'
str2 db 'Enter second ascii:$'
n db ($-ar2)

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
    adc al,ar2[si]
    aaa
    mov ar3[si+1],al
    
    dec si
    
    loop l1
    
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