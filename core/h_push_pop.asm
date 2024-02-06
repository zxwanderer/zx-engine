 	ifndef _PUSH_POP_H_
  	define _PUSH_POP_H_

  MACRO DO_PUSH_ALL_REGISTRY
	push af,bc,de,hl,ix,iy
	exx : ex af, af'
	push af,bc,de,hl,ix,iy
  ENDM

  MACRO DO_POP_ALL_REGISTRY
	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
  ENDM

  MACRO HL_PTR_TO_HL
  LD (.ptr+1), HL
.ptr
  LD HL, (#0000)
  ENDM

	endif
