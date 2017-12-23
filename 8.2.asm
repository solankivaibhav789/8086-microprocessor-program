.model small
.data
	str1 db "enter your password:$"
	password db "solanki"
	mfs db "match found$"		;print this string if match found
	mnfs db "match not found$"	;print this string if match not found
	buffer db 10,?,dup(0)
.code
	
	;take input
	input macro string
	lea dx,string
	mov ax,0900h
	int 21h
	
	lea dx,buffer
	mov ax,0a00h
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
	output macro string
	newline				;call newline macro
	lea dx,string
	mov ax,0900h
	int 21h
	output endm
	
	
mov ax,@data
mov ds,ax

	input str1
	lea si,buffer
	lea di,password
	add si,02h              ;because when string take as input 
	                        ;first byte-->max char
	                        ;second byte-->length
	                        ;then start string
	                        ;so add 02 to si 
	mov cl,buffer[01]       ;buffer second byte have length so transfer to cx
	dec cl                  ;one comparision is less than length so decrement
	back:
	mov ax,[si]
	cmp ax,[di]
	jne l2
	inc si
	inc di
	loop back
	
	l1:                  ;if match found than 
	output mfs
	jmp skip
	l2:                  ;if match not found than
	output mnfs
	jmp skip
	
	skip: 

mov ax,4c00h
int 21h
end