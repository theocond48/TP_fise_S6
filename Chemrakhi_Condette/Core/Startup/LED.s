/*
 * LED.s
 *
 *  Created on: Jan 28, 2026
 *      Author: ZafkieL
 */
// COMMON DIRECTIVES to Use ASM Language
.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global LED_Enable
.type  LED_Enable, %function
.text
LED_Enable:
	PUSH {R0-R2,LR}
	LDR R0,=0x4002104C
	MOV R1,#0x01
	LDR R2,[R0]
	ORR R1,R1,R2
	STR R1,[R0]
	POP {R0-R2,PC}


.global LED_Config
.type LED_Config, %function
.text
LED_Config:
.equ GPIOA, 0x48000000
.equ GPIOA_MODER, GPIOA+0x00
	PUSH {R0-R3,LR}
	LDR R0,= GPIOA_MODER
	LDR R1,[R0]
	LDR R2,=0xFFFFF3FF
	AND R1,R2
	LDR R3,=0x400
	ORR R1,R3
	STR R1,[R0]
	POP {R0-R3,PC}

.global LED_DriveGreen
.type LED_DriveGreen, %function
.text
LED_DriveGreen:
.equ GPIOA, 0x48000000
.equ GPIOA_ODR, GPIOA+0x14
	PUSH {R4-R7, LR}
	LDR R4,=GPIOA_ODR
	MOV R5,#1
	AND R0,R0,R5
	LDR R6,[R4]
	CMP R0,#1
	BEQ SET_ON

	LDR R7,=0x0DF
	AND R6,R6,R7
	STR R6,[R4]
	B RET_FUNCT
SET_ON:
	LDR R7,=0x20
	ORR R6,R6,R7
RET_FUNCT:
	STR R6,[R4]
	POP {R4-R7, PC}

