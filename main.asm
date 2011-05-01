
; file convert_angle.asm


.include "m103def.inc"
.include "macros.asm"
.include "definitions.asm"


reset:
	LDSP RAMEND
	rcall display_init
	rjmp main
	
.include "display_status.asm"
.include "convert_angle.asm"



main:
	rcall display_status 
	rjmp main