.MODEL SMALL
.STACK 64
.DATA
	MSG1 DB "Enter first number", 13, 10, "$"
	MSG2 DB "Enter second number", 13, 10, "$"
	MSG3 DB "You entered these 2 numbers", 13, 10, "$"
	MSG4 DB "Result is", 13, 10, "$"
.CODE
	mov ax,@DATA
	mov ds,ax
	
	;DISPLAY MESSAGE FOR FIRST NUMBER.
	mov ah,09h
	mov dx, offset MSG1
	int 21h
	;CAPTURE NUMBER AS STRING.
	mov ah, 01h
	int 21h
	mov bl, al
	
	;DISPLAY MESSAGE FOR SECOND NUMBER.
	mov ah,09h
	mov dx, offset MSG2
	int 21h
	;CAPTURE NUMBER AS STRING.
	mov ah, 01h
	int 21h
	mov bh, al
	
	;DISPLAY what user entered
	mov ah,09h
	mov dx, offset MSG3
	int 21h
	
	mov ah, 02h
	mov dl, bl
	int 21h
	mov ah, 02h
	mov dl, bh
	int 21h
	
	;DISPLAY MESSAGE FOR RESULT.
	mov ah,09h
	mov dx, offset MSG4
	int 21h
	
	;dısplay sum
	add bl,bh
	sub bl, 30h
	mov ah, 02h
	mov dl, bl
	int 21h
	
	
	mov ah,4Ch
	int 21h
	
	END
