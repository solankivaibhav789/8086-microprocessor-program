;wap to reverse given string
;lodsb --> content of si store in al or ax
;stosb --> store in adress of di
;std  --> set direction so di value is decrement
;
.model small

.data
    str1 db 'solanki vaibhav$'
    len dw ($-str1)
    str2 db len dup(0)
.code
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,str1
    lea di,str2
    add di,len
    mov cx,len
    mov [di],'$'
    dec di
    
    again:
    cld                 ;clear direction (d) flag
    lodsb               ;here use si so si increment because d=0
    std                 ;set direction (d) flag
    stosb               ;here use di so di decrement because d=1
    loop again
    
mov ax,4c00h
int 21h