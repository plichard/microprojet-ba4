
; file display_status.asm


.include "lcd.asm"


display_init:
	OUTI	DDRB,0xff	;configure portB to output		
	rcall	LCD_init	;initialize LCD
	rcall	LCD_blink_on	;turn blinking on
	ret
	
display_status:
	
	rcall LCD_clear
	
	;premiere ligne pour la vitesse
	ldi a0,0x0
	rcall LCD_pos
	ldi a0,'['
	rcall lcd_putc
	; faire boucle pour afficher la barre de progression
	;boule
	push r18
	ldi r18,5
	rcall lcd_putc
	dec r18
	brne PC-1
	;/boucle
	ldi a0,']'
	rcall lcd_putc
	pop r18
	
	
	;deuxieme ligne pour la rotation
	ldi a0,0x40
	rcall LCD_pos
	ldi a0,'['
	rcall lcd_putc
	ldi a0,']'
	rcall lcd_putc
	ret