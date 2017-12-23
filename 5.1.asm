;wap for finding length of given string   
.model small
.stack 64h
.data
    str1 db 'solanki vaibhav$'
    len db ($-str1)        ;--> direct length find 
    ;each char have 8 bit size and here 16 char so size is 128 decimal = 80 hexa
    len1 db 0
.code
    mov ax,@data
    mov ds,ax
    ;string are in di
    ;si have $
    ;SCASB not write operand
    ;use je 
    ;direction flag(d) =0 di increment --> for forword method
    ;direction flag(d) =1 di decrement --> for reverse method
    ;lenth incremnt
    ;si also increment
    ;di not increment by programmmer it increment automatically
    lea si,str1
    again:
        mov al,'$'
        cmp [si],al
        jz break
        inc si
        inc len1
        jnz again
     break:
    

mov ax,4c00h
int 21h
