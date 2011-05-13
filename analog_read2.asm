;file analog read
; register modified : r23,a0,a1,b0
; utilisation timer 0, portD 1


;========== interrupt table======

.org	0
		jmp	reset

.org	ADCCaddr
		jmp	ADCCaddr_sra
.org	OVF0addr			;timer 0 interrupt vector
		jmp	PortB_inv		

.org	0x30


;===========interrupt service routine===

ADCCaddr_sra : 

	ldi	r23,0x01	;set the flag
	reti	

PortB_inv :
	INVP	PORTD,1		; invert portB
	reti


;==========initialisation
reset :

	OUTI	TIMSK,(1,TOIE0)	;timer0 overflow interrupt enable
	OUTI	ASSR,(1<<AS0)	;clock external (32768Hz)
	OUTI	TCCR0,2
	
	OUTI	ADCSR,(1<<ADEN) +(1<<ADIE)+7;AD enable,Ad int. enable, Ps = ck/128
	OUTI	ADMUX,POT
	sei

	rjmp main

main : 

	WAIT_MS	1000
	clr	r23			;reset r23
	
	in		w,PIND	;demarre à l'appuis de pd0 --> Remplacer par un timer toutes les 100ms
	sbrc	w,0
	jmp		PC-2


	sbi		ADCSR,ADSC
	WBO		r23,0

	in		a0,ADCL
	in		a1,ADCH
	

	a0<<2 	; décale parce qu'on as pas besoin d'autant de présicon et on peut
	add a0,a1	; ainsi mettre la lecture de l'analogique dans un seul registre 

	mov b0,a0	;save a0
	
