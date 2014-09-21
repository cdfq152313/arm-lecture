	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {lr}

	@ if (R0 == 0) goto .L3 (which returns 0)
    cmp r0, #0
    beq .L3

	@ If (R4 == 1) goto .L4 (which returns 1)
    cmp r0, #1
    beq .L4
    
    @forloop fib(n) = fib(n-2) + fib(n-1)
    @         r3    =   r1     +  r2

    @init
    mov r1, #0
    mov r2, #1
    subs r0, #1

    @start
Forloop:
    add r3, r1, r2
    mov r1, r2
    mov r2, r3
    subs r0, #1
    bgt Forloop

    @ save result
    mov r0, r3

	pop {pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
