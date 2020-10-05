MAIN	START	1000
	LDT	#1
	JSUB	STKINIT
		
	LDX	#0	
RLOOP	TD	INPUT	.Initialzie_Node_Number
	JEQ	RLOOP
	LDA	#0
	RD	INPUT
	COMP	ENTER
	JEQ	NUM
	STCH	LEN,X
	STA	NODE_NO
	TIX	MAXLEN		
	J	RLOOP

NUM	LDX	#1
	LDCH	LEN,X
	COMP	#0
	JEQ	ARRINIT
	LDX	#0
	LDCH	LEN,X
	COMP	#49
	JEQ	TEN
	LDX	#1
	LDCH	LEN,X
	ADD	#20
	STA	NODE_NO
	J	ARRINIT
	
TEN	LDX	#1
	LDCH	LEN,X
	ADD	#10
	STA	NODE_NO
	J	ARRINIT

LEN	RESB	2

ARRINIT	LDX	#0	.Initialize_Node_Array
RLOOP2	LDA	#0
	TD	INPUT
	JEQ	RLOOP2
	RD	INPUT
	COMP	SPACE	.Ignore_Space
	JEQ	RLOOP2
	STCH	Arr, X
	TIX	MAXLEN
	COMP	ENTER
	JEQ	LINECNT
	J	RLOOP2	

LINECNT	LDS	LINE
	ADDR	T,S
	STS	LINE
	LDA	#0
	LDA	LINE
	COMP	NODE_NO
	JEQ	EXIT
	J	RLOOP2

LINE	WORD	48

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

NODE_NO	RESW	1
Arr	RESB	200
MAXLEN	WORD	200

EXIT	LDA	#0

