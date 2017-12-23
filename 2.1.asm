;sum of two aray store in 3rd ary
.model small
.stack 64h
.data
arr1 dw 1000h, 2222h, 3333h, 4444h,5555h
arr2 dw 0ffffh, 3333h, 9999h, 9999h,2222h
arr3 dw 6 dup(0)
n dw 5
.code
    main proc near
    mov ax,@data
    mov ds,ax
    mov cx,05
    
    lea si,arr1
    lea bx,arr2
    lea di,arr3
    
    mov ax,n
    dec ax
    add ax,ax
    
    add si,ax
    add bx,ax
    add di,ax
    add di,02       ;for go to last elemnt of arr3 beacuse arr3 have 6 element  
    again:         
    mov ax,[si]
    adc ax,[bx]
    mov [di],ax
    
    dec si
    dec si
    dec bx
    dec bx
    dec di
    dec di
    loop again
    mov ax,0000h
          
    adc ax,0000h
    mov [di],ax
    skip:
   
    mov dx,4c00h
    int 21h
    
    main endp
end
    
    
    
    