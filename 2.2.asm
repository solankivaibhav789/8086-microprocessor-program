
;Write a program to subtract two n-word array

.model small
.data
    arr1 dw 0001h,0002h,0003h,0004h,0005h
    arr2 dw 0007h,0006h,0001h,0002h,0001h
    n equ 05
    arr3 dw 06h dup(?)
    
.code
    main proc near
        mov ax,@data
        mov ds,ax
        lea si,arr1
        lea bx,arr2
        lea di,arr3
         
        mov cl,n
        mov ch,00h
        
        mov ax,n
        add ax,ax
        add di,ax
        sub ax,02h
        
        add si,ax    ;because add si with 2 x number of word
        add bx,ax
        
      l1: mov ax,[si]
          sbb ax,[bx]
          mov [di],ax
          sub si,02h
          sub bx,02h
          sub di,02h
       loop l1
          mov ax,0000h
          adc ax,0000h
          mov [di],ax
     
       mov ah,4ch
       int 21h
       main endp
    end main




