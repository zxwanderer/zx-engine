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

		endif
