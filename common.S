/*
 * common.S - common definitions useful for boot code
 *
 * Copyright (C) 2013 ARM Limited. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE.txt file.
 */

#define	CURRENTEL_EL3	(3 << 2)

#define SPSR_A		(1 << 8)	/* System Error masked */
#define SPSR_D		(1 << 9)	/* Debug masked */
#define SPSR_I		(1 << 7)	/* IRQ masked */
#define SPSR_F		(1 << 6)	/* FIQ masked */
#define SPSR_EL2H	(9 << 0)	/* EL2 Handler mode */

#define SPSR_KERNEL	(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL2H)

	/*
	 * Drop EL to that specified by the spsr value in register mode, at
	 * the address specified in register addr.
	 */
	.macro	drop_el	mode addr
	msr	elr_el3, \addr
	msr	spsr_el3, \mode
	eret
	.endm