.MODEL SMALL
.STACK 64
.DATA
	MSG1 DB 13, 10, "Enter first number ", "$"
	MSG2 DB 13, 10, "Enter second number ", "$"
	MSG3 DB 13, 10, "You entered these 2 numbers ", "$"
	
	MSGGreater DB 13, 10, "First Number is smaller", "$"
	MSGEqual DB 13, 10, "Numbers are equal", "$"
	MSGSecondGreater DB 13, 10, "Second Number is smaller", "$"
	
.CODE
Main:
	mov ax,@DATA
	mov ds,ax
	 
	;DISPLAY MESSAGE FOR FIRST NUMBER.
	mov ah,09h
	mov dx, offset MSG1
	int 21h
	;CAPTURE NUMBER AS STRING.
	mov ah, 01h
	int 21h
	mov bh, al
	;DISPLAY MESSAGE FOR SECOND NUMBER.
	mov ah,09h
	mov dx, offset MSG2
	int 21h
	;CAPTURE NUMBER AS STRING.
	mov ah, 01h
	int 21h
	mov bl, al
	;DISPLAY what user entered
	mov ah,09h
	mov dx, offset MSG3 ; dısplay message fırst
	int 21h
	
	mov ah, 02h
	mov dl, bl  ; dısplay bl
	int 21h
	mov ah, 02h
	mov dl, bh ; dısplay bh
	int 21h
	
	;DISPLAY MESSAGE FOR RESULT.
	;compare 
	and bx, 0F0Fh
	cmp bh, bl
	jc NotGreater
	jnc Greater
	jz Equal

Greater:
	mov ah,09h
	mov dx, offset MSGGreater
	int 21h
	jmp exit
NotGreater:
	mov ah,09h
	mov dx, offset MSGSecondGreater
	int 21h
	jmp exit
Equal:
	mov ah,09h
	mov dx, offset MSGEqual
	int 21h
	jmp exit
exit:
	mov ah,4Ch
	int 21h
	
	END Main
