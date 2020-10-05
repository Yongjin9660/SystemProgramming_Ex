MAIN	START	1000
FIRST	JSUB	STKINIT

LEN	LDA	#0	.Initialize Node Number
RLOOP1	TD	INPUT
	JEQ	RLOOP1
	RD	INPUT
	COMP	ENTER
	JEQ	ARRINIT
	STCH	Node_No
	J	RLOOP1
	
ARRINIT	LDX	#0	.Initialize Node Array
RLOOP2	TD	INPUT
	JEQ	RLOOP2
	RD	INPUT
	COMP	SPACE
	JEQ	RLOOP2
	STCH	Arr, X
	TIX	MAXLEN
	J	RLOOP2	


.Stack
STKINIT	LDA	#STACK
	STA	TOP
	RSUB

PUSH	LDA	TOP
	ADD	#3
	STA	TOP
	RSUB

POP	LDA	TOP
	SUB	#3
	STA	TOP
	RSUB

STACK	RESW	30
TOP	RESW	1

INPUT	BYTE	0
OUTPUT	BYTE	1
ENTER	WORD	10
SPACE	WORD	32

Node_No	RESB	1
Arr	RESB	200
MAXLEN	WORD	200
