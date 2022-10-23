position_cursor MACRO Page_Number, columns,Rows
;;;;;;POSITION THE CURSOR IN THE CENTER;;;;;;
  mov ah,2; Settings for Cursor POSITION
  mov bh,Page_Number; Contains Page Number which is 0 here
  mov dl,columns; mid-point of columns (Total Cols = 80)
  mov dh,Rows ; mid-point of Rows (Total Rows = 25)
  int 10h 

endm
display_score macro score
mov ax,score
mov dx,0
mov bx,10
mov cx,0
	l5:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
		jne l5
		mov ah,2
	l6:
		pop dx
		add dx,48
		int 21h
		loop l6
endm
display1_score macro score
mov ax,score
mov dx,0
mov bx,10
mov cx,0
	loop_5:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
		jne loop_5
		mov ah,2
	loop_6:
		pop dx
		add dx,48
		int 21h
		loop loop_6
endm
stop macro arr1,arr2,x,y
	mov si,20
	mov bp,20
	push cx
	push dx
	mov cx,x
	mov dx,y
check1:
	cmp [arr1+si],cx
	je check2
	dec si
	cmp si,0
	je check2
jmp check1

check2:
	cmp [arr2+bp],dx
	je exit_1
	dec bp
	cmp bp,0
	je exit_2
jmp check2

exit_1:
	mov decisionx,1
	mov decisiony,1
exit_2:
print_over decisionx,decisiony,x,y
endm

print_over macro decisionx,decisiony,x,y
	
	check3:
		cmp decisionx,1
		je check4
		jmp exit_3
	check4:
		cmp decisiony,1
		je exit_4
		jmp exit_3
exit_4:
enemies1 x,y
exit_3:
endm

bullet macro x,y
mov ah,0ch ; Config to write Pixel on screen
mov bh,0; BH contains page number
mov al,0Eh ; Changing the color of the Candy: Red here

	push x
	push y
	;choosing position for placing Candy: 
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,5
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	pop y
	pop x
endm
bullet1 macro x,y
mov ah,0ch ; Config to write Pixel on screen
mov bh,0; BH contains page number
mov al,00h ; Changing the color of the Candy: Red here
	push x
	push y
	;choosing position for placing Candy: 
	
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW #
	add x,5
	add y,5
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	pop y
	pop x
endm
spaceship macro x,y,dia
mov ah,0ch ; Config to write Pixel on screen
mov al,0Fh ; AL contains color and F = White Color
mov bh,0; BH contains page number
	push x
	push y
	mov al,04h ; Changing the color of the Candy: Red here
	
	;choosing position for placing Candy: 
	
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,10
	mov al,03h
	;rectangle 2
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW #
	; for conditions
	add x,15
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,20
	mov al,03h
	;rectangle 3
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; for conditions
	add x,25
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,30
	mov al,03h
	;rectangle 4
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,35
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,35
	mov al,04h
	;diagnol 1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	dec cx
	.until (dx==y)
	
	; for assigning values
	add x,25
	sub y,10
	mov al,04h
	;diagonal 2
	mov cx,x; CX contains X-axis position Column #
	mov dia,cx
	add dia,6
	mov dx,y; DX contains Y-axis position ROW # 
	; for conditions
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==dia)
		inc dia
	inc dx
	pop cx
	.until (dx==y)
	pop y
	pop x
endm
spaceship1 macro x,y,dia
mov ah,0ch ; Config to write Pixel on screen
mov al,0Fh ; AL contains color and F = White Color
mov bh,0; BH contains page number
	mov al,00h ; Changing the color of the Candy: Red here
	
	;choosing position for placing Candy: 
	
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,10
	mov al,00h
	;rectangle 2
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW #
	; for conditions
	add x,15
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,20
	mov al,00h
	;rectangle 3
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; for conditions
	add x,25
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,30
	mov al,00h
	;rectangle 4
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,35
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	
	; for assigning values
	sub x,35
	mov al,00h
	;diagnol 1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	dec cx
	.until (dx==y)
	
	; for assigning values
	add x,25
	sub y,10
	mov al,00h
	;diagonal 2
	mov cx,x; CX contains X-axis position Column #
	mov dia,cx
	add dia,6
	mov dx,y; DX contains Y-axis position ROW # 
	; for conditions
	add y,10
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==dia)
		inc dia
	inc dx
	pop cx
	.until (dx==y)
endm
enemies macro x,y
mov ah,0ch ; Config to write Pixel on screen
	mov al,0Fh ; AL contains color and F = White Color
	mov bh,0; BH contains page number

	push x
	push y
	mov al,04h ; Changing the color of the Candy: Red here
	;choosing position for placing Candy: 
	mov cx,x; CX contains X-axis position Column #
	mov [arr1+si],cx
	add [arr1+si],7

	mov dx,y; DX contains Y-axis position ROW #
	mov [arr2+bp],dx

	add x,15
	add y,15
	; Drawig Candy in the area of Grid
		.Repeat
		push cx
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	sub x,13
	sub y,12
	mov al,03h;eye1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,4
	add y,5
	; Drawig Candy in the area of Grid
		.Repeat
		push cx
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	add x,3
	sub y,4
	mov al,03h;eye2
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; Drawig Candy in the area of Grid
	add x,4
	add y,4	
	.Repeat
	push cx	
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	sub x,9
	add y,3
	mov al,03h;mouth
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; Drawig Candy in the area of Grid
	add x,6
	add y,2
	.Repeat
	push cx	
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	pop y
	pop x
endm
enemies1 macro x,y
mov ah,0ch ; Config to write Pixel on screen
	mov al,0Fh ; AL contains color and F = White Color
	mov bh,0; BH contains page number

	push x
	push y
	mov al,00h ; Changing the color of the Candy: Red here
	;choosing position for placing Candy: 
	mov cx,x; CX contains X-axis position Column #
	
	mov dx,y; DX contains Y-axis position ROW #
	
	add x,15
	add y,15
	; Drawig Candy in the area of Grid
		.Repeat
		push cx
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	sub x,13
	sub y,12
	mov al,00h;eye1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	add x,4
	add y,5
	; Drawig Candy in the area of Grid
		.Repeat
		push cx
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	add x,3
	sub y,4
	mov al,00h;eye2
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; Drawig Candy in the area of Grid
	add x,4
	add y,4	
	.Repeat
	push cx	
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	sub x,9
	add y,3
	mov al,00h;mouth
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW # 
	; Drawig Candy in the area of Grid
	add x,6
	add y,2
	.Repeat
	push cx	
			.Repeat
			int 10h
			inc cx
			.until (cx==x)
		
		inc dx
		pop cx
		.until (dx==y)
	mov y2,dx
	pop y
	pop x
endm

;level_2:

position_cursor_1 MACRO Page_Number, columns,Rows
;;;;;;POSITION THE CURSOR IN THE CENTER;;;;;;
  mov ah,2; Settings for Cursor POSITION
  mov bh,Page_Number; Contains Page Number which is 0 here
  mov dl,columns; mid-point of columns (Total Cols = 80)
  mov dh,Rows ; mid-point of Rows (Total Rows = 25)
  int 10h 

endm
display_1_score macro score
mov ax,score_1
mov dx,0
mov bx,10
mov cx,0
	l3:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
		jne l3
		mov ah,2
	l4:
		pop dx
		add dx,48
		int 21h
		loop l4
endm
display1_1_score macro score
mov ax,score_1
mov dx,0
mov bx,10
mov cx,0
	l7:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
		jne l7
		mov ah,2
	l8:
		pop dx
		add dx,48
		int 21h
		loop l8
endm

stop_1 macro arr3,arr4,x,y
	mov si,20
	mov bp,20
	push cx
	push dx
	mov cx,x
	mov dx,y
check1_:
	cmp [arr3+si],cx
	je check2_
	dec si
	cmp si,0
	je check2_
jmp check1_

check2_:
	cmp [arr4+bp],dx
	je exit1_
	dec bp
	cmp bp,0
	je exit2_
jmp check2_

exit1_:
	mov decisionx,1
	mov decisiony,1
exit2_:
print_over_1 decisionx,decisiony,x,y
endm

print_over_1 macro decisionx,decisiony,x,y
	
	check_3:
		cmp decisionx,1
		je check_4
		jmp exit3_
	check_4:
		cmp decisiony,1
		je exit4_
		jmp exit3_
exit4_:
enemies1_1 x,y
exit3_:
endm

bullet_1 macro x,y
mov ah,0ch ; Config to write Pixel on screen
mov bh,02; BH contains page number
mov al,0Eh ; Changing the color of the Candy: Red here

	push x
	push y
	;choosing position for placing Candy: 
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	
	mov dx,y; DX contains Y-axis position ROW # 
	add x,5
	add y,5
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	pop y
	pop x
endm
bullet1_1 macro x,y
mov ah,0ch ; Config to write Pixel on screen
mov bh,0; BH contains page number
mov al,00h ; Changing the color of the Candy: Red here
	push x
	push y
	;choosing position for placing Candy: 
	
	;rectangle 1
	mov cx,x; CX contains X-axis position Column #
	mov dx,y; DX contains Y-axis position ROW #
	add x,5
	add y,5
	.Repeat
	push cx
		.Repeat
		int 10h
		inc cx
		.until (cx==x)
	inc dx
	pop cx
	.until (dx==y)
	pop y
	pop x
endm


spaceship_1 macro x,y
mov ah,0ch
mov al,03h
push x
push y
;1)
mov cx,x
mov dx,y
add x,10
add y,5
.repeat
push cx
	.repeat
		inc cx
		int 10h
	.until(cx==x)
	inc dx
	pop cx
.until(dx==y)

;2)
sub x,15
mov cx,x
mov dx,y
add x,20
add y,20
mov al,04h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

;3)
sub x,1
mov cx,x
mov dx,y
add x,5
add y,10
mov al,08h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)
	
;4)
sub x,28
sub y,10
mov cx,x
mov dx,y
add x,5
add y,10
mov al,08h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

pop y
pop x
endm

spaceship1_1 macro x,y
mov ah,0ch
mov al,00h
mov bh,02
push x
push y
;1)
mov cx,x
mov dx,y
add x,10
add y,5
.repeat
push cx
	.repeat
		inc cx
		int 10h
	.until(cx==x)
	inc dx
	pop cx
.until(dx==y)

;2)
sub x,15
mov cx,x
mov dx,y
add x,20
add y,20
mov al,00h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

;3)
sub x,1
mov cx,x
mov dx,y
add x,5
add y,10
mov al,00h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)
	
;4)
sub x,28
sub y,10
mov cx,x
mov dx,y
add x,5
add y,10
mov al,00h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

pop y
pop x
endm

enemies_1 macro x,y
push x
push y
mov ah,0ch
mov al,07h

mov cx,x
mov [arr3+si],cx
add [arr3+si],10

mov dx,y
mov [arr4+bp],dx

add x,5
add y,10

.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)
sub y,10
add x,5
mov cx,x
mov dx,y
add x,5
add y,10
mov al,07h

.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

sub x,10
sub y,7

mov cx,x
mov dx,y
add x,5
add y,5
mov al,04h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

sub x,3
sub y,5
mov cx,x
mov dx,y

add x,2
add y,5
mov al,08h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

pop y
pop x

endm
enemies1_1 macro x,y
push x
push y
mov ah,0ch
mov al,00h

mov cx,x
mov dx,y

add x,5
add y,10

.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)
sub y,10
add x,5
mov cx,x
mov dx,y
add x,5
add y,10
mov al,00h

.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

sub x,10
sub y,7

mov cx,x
mov dx,y
add x,5
add y,5
mov al,00h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

sub x,3
sub y,5
mov cx,x
mov dx,y

add x,2
add y,5
mov al,00h
.repeat
push cx
	.repeat
			inc cx
			int 10h
		.until(cx==x)
		inc dx
		pop cx
	.until(dx==y)

pop y
pop x

endm

enemies_print macro x1,y1
mov bh,02
push x1
push y1
push bx
mov bl,cond_var1
mov bh,cond_var2
.repeat
push x1
		.repeat
			add x1,50
			enemies_1 x1,y1
			inc loop_var1
		.until(loop_var1==bl)
	add y1,20
	pop x1
	inc loop_var2
	mov loop_var1,0
	.until(loop_var2==bh)
pop bx
pop y1
pop x1
endm

enemies_print1 macro x1,y1
mov bh,02
push x1
push y1
push bx
mov bl,cond_var1
mov bh,cond_var2
.repeat
push x1
		.repeat
			add x1,50
			enemies1_1 x1,y1
			inc loop_var1
		.until(loop_var1==bl)
	add y1,20
	pop x1
	inc loop_var2
	mov loop_var1,0
	.until(loop_var2==bh)
pop bx
pop y1
pop x1
endm



include a1.lib
.model small
.stack 100h
.data
username1 db 100 dup('$')
entername db 'ENTER USER NAME : $'
title1 db  '|***** WELCOME *****|','$'
title2 db 'TO GALAXY ATTACK:','$'
title3 db 'ALIEN SHOOTER','$'
dev1 db 'Ahmed Hayat','$'
dev2 db 'Senir Kashir','$'
dev3 db 'Sufian Ahmed Shah','$'


	rules db 'HOW TO PLAY!','$'
	lineabove db    '--------','$'
	start_button db '\ PLAY /','$'
	quit db '!! QUIT BUTTON !!$'
	howto db 'HOW TO PLAY:','$'
	skip_to_level2 db 'Skip To L2$'
	not_skip_to_level2 db 'NOT Skip To L2$'
	skip_to_level3 db 'Skip To L3$'
	not_skip_to_level3 db 'NOT Skip To L3$'
	rule1 db '1. Use keyboard keys (right and left)to move spaceship.','$'
	rule2 db '2. Press enter key to shoot','$'
	rule3 db '3. When the bullet hits the enemy then he will explode .','$'
	rule4 db '4. The score will be recorded when the enemy will explode.','$'
		level1 db 'LEVEL 1','$'
	level2 db 'LEVEL 2 ','$'
	level3 db 'LEVEL 3','$'
		clickonthescreen db 'CLICK ON THE SCREEN$'
	writeyourname db 'Write Your Name: $'
	filename db 'file2_1.txt',0
	buffer dw 50 dup(?)
	counter dw 0
	fhandle dw 0
	
	dia dw ?; diagonal 2 var
	x dw 80
	y dw 140
	x1 dw 0
	y1 dw 0
	x2 dw 0
	y2 dw 0
	loop_var1 db 0
	loop_var2 db 0
	x3 dw 10
	y3 dw 10
	str1 db "SCORE: $"
	score dw 0
	tempx dw 0
	arr1 dw 20 dup(?)
	arr2 dw 20 dup(?)
	x4 dw 0
	y4 dw 0
	decisionx db 0
	decisiony db 0
	loop_var3 db 0
	bullet_stop db 0
	enemies_pos dw 70
	loop_var4 db 0
	loop_var5 db 0
	Page_Number db 0
	columns db 10
	Rows db 0
	
	x5 dw 80
	y5 dw 140
	x6 dw 5
	y6 dw 5
	x7 dw 0
	y7 dw 0
	x8 dw 5
	y8 dw 5
	x9 dw 0
	y9 dw 0
	loop_var6 db 0
	loop_var7 db 0
	loop_var8 db 0
	loop_var9 db 0
	cond_var1 db 5
	cond_var2 db 4
	score_1 dw 0
	str2 db "Score: $"
	stop_enemies dw 80
	enemies_pos_1 dw 65
	arr3 dw 20 dup(?)
	arr4 dw 20 dup(?)
	decisionx_1 db 0
	decisiony_1 db 0
.code
main proc
MOV AX,@DATA
MOV DS,AX
DISPLAY:

;Screen Selection
mov AH,00h
mov AL,12h ;640 x 480
mov bh,00h
int 10h
display_start1
;call DISPLAY
;;;;;;;;;;;;;;TURNING PLAY INTO A BUTTON;;;;;;;;;;;;;;;;;;;;;;;
mov ax,01
int 33h
.repeat
	mov ax,05
	int 33h	
	.if bx==0 && cx<=600 && cx>=500 && dx<=300 && dx>=200
		change_background 0,0,0,30,80,00001110b ;clear_screen,upper_row_num,left_column_num,lower_row_num,right_column_num,color    
		position_cursor 0,5,2 ;PG_NUM,colnum,rows
		string_print howto
		position_cursor 0,19,5 ;PG_NUM,colnum,rows
		string_print rule1
		position_cursor 0,19,10 ;PG_NUM,colnum,rows
		string_print rule2
		position_cursor 0,19,15 ;PG_NUM,colnum,rows
		string_print rule3
		position_cursor 0,19,20 ;PG_NUM,colnum,rows
		string_print rule4
		
		position_cursor 0,19,25 ;PG_NUM,colnum,rows
		string_print quit
		
		quitit:
			mov ax,05
			int 33h
			cmp bx,0
			jne quitit
			cmp cx,400
			jnle quitit
			cmp cx,200
			jnge quitit
			cmp dx,400
			jnge quitit
			cmp dx,480
			jnle quitit
		skip:
		jmp DISPLAY
	.endif
.until bx==0 && cx<=600 && cx>=500 && dx<=480 && dx>=300
MOV AH,00h; Selecting Video Mode
MOV AL,13 ; Selecting Resolution:320x200 256 color graphics (MCGA,VGA)
INT 10h; Selecting Inerupt for Graphics mode
; Setting for Background Color
mov dx,offset str1
mov ah,09
int 21h
mov ah,0Bh
mov bh,01h; fix setting for background color
mov bl,00h; choose color Blue color
int 10h
mov si,0
mov bp,0
push x3
push y3
.repeat
		.repeat
			add x3,50
			enemies x3,y3
			inc si
			inc bp
			inc loop_var1
		.until(loop_var1==5)
	add y3,20
	mov x3,10
	inc loop_var2
	mov loop_var1,0
	.until(loop_var2==4)
pop y3
pop x3
jmp loop_1
increment:
inc loop_var5
sub enemies_pos,20
mov loop_var4,0
; Drawing A Grid first in which later we will place candy
loop_1:
spaceship x,y,dia
movement:
mov cx,x
mov dx,y
mov x1,cx
mov y1,dx
mov ah,00h
int 16h
.if(ah == 75)
sub x,5
.elseif(ah == 77)
add x,5

.endif
cmp al,13
je loop_2
spaceship1 x1,y1,dia

spaceship x,y,dia
jmp loop_1

print1:
sub y1,1
loop_2:
	bullet x1,y1
	stop arr1,arr2,x1,y1
	bullet1 x1,y1

mov dx,enemies_pos
cmp y1,dx
je cond
jmp print1

cond:
inc loop_var4
inc score
cmp score,20
je finish_1
position_cursor Page_Number, columns,Rows

display_score score
cmp loop_var4,5
je increment
jmp loop_1


finish_1:
position_cursor Page_Number, columns,Rows

display1_score score

lev_2:
MOV AH,00h; Selecting Video Mode
MOV AL,13 ; Selecting Resolution:320x200 256 color graphics (MCGA,VGA)
INT 10h; Selecting Inerupt for Graphics mode
; Setting for Background Color
mov ah,0Bh
mov bh,02h; fix setting for background color
mov bl,00h; choose color Blue color
int 10h
mov si,0
mov bp,0
mov dx,offset str2
mov ah,09
int 21h
jmp loop_1_
	;enemies_print x1,y1
increment_:
sub enemies_pos_1,20

loop_1_:
	spaceship_1 x5,y5
	mov loop_var6,0
	mov loop_var7,0
	enemies_print x6,y6
		movement_1:
			mov cx,x5
			mov dx,y5
			mov x7,cx
			mov y7,dx
			mov ah,00h
			int 16h
			.if(ah == 75)
				sub x5,5
				add y6,5
			.elseif(ah == 77)
				add x5,5
				add y6,5

			.endif
			cmp al,13
			je bullet_print
			spaceship1_1 x7,y7
			mov loop_var6,0
			mov loop_var7,0
			mov cx,x6
			mov dx,y6
			sub dx,5
			mov x8,cx
			mov y8,dx
			enemies_print1 x8,y8
			mov loop_var6,0
			mov loop_var7,0
			enemies_print x6,y6
			
			spaceship_1 x5,y5
			push bx
			mov bx,stop_enemies
			cmp y1,bx
			je finish
			
jmp loop_1_
bullet_print:
mov cx,x
	mov dx,y
	mov x4,cx
	mov y4,dx
	sub y4,4

print1_:
sub y4,1
loop_2_:
	
	bullet_1 x9,y9
	stop_1 arr3,arr4,x9,y9
	bullet1_1 x9,y9
mov dx,enemies_pos_1
cmp y9,dx
je cond_
jmp print1_

cond_:
inc loop_var8
dec cond_var2
add score_1,5
add stop_enemies ,20
cmp score_1,20
je finish
position_cursor_1 Page_Number, columns,Rows

display_1_score score
cmp loop_var4,5
je increment_
jmp loop_1_


finish:
pop bx
position_cursor_1 Page_Number, columns,Rows

display1_1_score score

main endp
end main