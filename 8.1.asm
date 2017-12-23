.model small
.data
	str1 db "enter your name:$"
	str2 db "enter your age:$"
	buffer db 20,?,dup(0)   ;20 is max legth and ? there store size of buffer and dup(0) all are 0
.code
	
	;take input                 ;input at last write '$' for string end
	input macro string
	lea dx,string
	mov ax,0900h
	int 21h
	
	lea dx,buffer
	mov ax,0a00h                ;because inttrupt use ah not al
	int 21h
	input endm
	
	;for newline
	newline macro
	mov dl,10				;bring cursor down
	mov ax,0200h
	int 21h
	
	mov dl,13				;bring cursor first column
	mov ax,0200h
	int 21h
	newline endm
	
	;print output
	output macro
	newline				;call newline macro
	lea dx,buffer[02h]     ;because string strat from third posision (02h) 
	mov ax,0900h
	int 21h
	output endm
	
	
mov ax,@data
mov ds,ax
	
	input str1
	output 
	newline
	input str2
	output
	
mov ax,4c00h
int 21h
end