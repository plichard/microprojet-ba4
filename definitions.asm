; file:	definitions.asm
; copyright (c) 2000-2002 R.Holzer
; 2002-01-09

; === definitions  ===
.nolist			; do not include in listing
.set	clock	= 4000000

.def	char	= r0	; character (ASCII)
.def	_sreg 	= r1	; saves the status during interrupts
.def	_u 	= r2	; saves working reg u during interrupt
.def	u	= r3	; scratch register (macros, routines)

.def	e0	= r4	; temporary reg for PRINTF 
.def	e1	= r5

.equ	c	= 8
.def	c0	= r8	; 8-byte register c
.def	c1	= r9
.def	c2	= r10
.def	c3	= r11

.equ	d	= 12	; 4-byte register d (overlapping with c)
.def	d0	= r12
.def	d1	= r13
.def	d2	= r14
.def	d3	= r15

.def	w	= r16	; working register for macros
.def	_w	= r17	; working register for interrupts

.equ	a	= 18
.def	a0	= r18	; 4-byte register a
.def	a1	= r19
.def	a2	= r20
.def	a3	= r21

.equ	b	= 22
.def	b0	= r22	; 4-byte register b
.def	b1	= r23
.def	b2	= r24
.def	b3	= r25

.equ	x	= 26	; pointer x
.equ	y	= 28	; pointer y
.equ	z	= 30	; pointer z

; === ASCII codes
.equ	BEL	=0x07	; bell
.equ	HT	=0x09	; horizontal tab
.equ	TAB	=0x09	; tab
.equ	LF	=0x0a	; line feed
.equ	VT	=0x0b	; vertical tab
.equ	FF	=0x0c	; form feed
.equ	CR	=0x0d	; carriage return
.equ	SPACE	=0x20	; space code
.equ	DEL	=0x7f	; delete
.equ	BS	=0x08	; back space

; === STK-300 ===
.equ	LED	= PORTB	; LEDs on STK-300
.equ	BUTTON	= PIND	; buttons on the STK-300

; === module encoder/speaker/remote ===
.equ	SPEAKER	= 2	; piezo speaker
.equ	ENCOD_A	= 4	; angular encoder A
.equ	ENCOD_B	= 5	; angular encoder B
.equ	ENCOD_I	= 6	; angular encoder button 
.equ	IR	= 7	; IR module for PCM remote control system

; === module I2C/1Wire ===
.equ	SCL	= 1	; I2C serial clock
.equ	SDA	= 3	; I2C serial data
.equ	DQ	= 5	; Dallas 1Wire

; === module Keyboard/Sharp/Servo ===
.equ	KB_CLK	= 0	; PC-AT keyboard clock line
.equ	KB_DAT	= 1	; PC-AT keyboard data line
.equ	GP2_CLK	= 2	; Sharp GP2D02 distance measuring sensor
.equ	GP2_DAT	= 3	; Sharp GP2D02 distance measuring sensor
.equ	SERVO1	= 4	; Futaba position servo
.equ	SERVO2	= 5	; Futaba position servo
.equ	SERVO3	= 6	; Futaba position servo	
.equ	SERVO4	= 7	; Futaba position servo

; === module potentiometer/BNC ===
.equ	POT	= 0	; potentiometer
.equ	BNC1	= 5	; BNC input
.equ	BNC2	= 7	; BNC input
.list