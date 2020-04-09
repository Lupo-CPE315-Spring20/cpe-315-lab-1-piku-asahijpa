    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr}

    @ Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr     r0, =message
    bl      printf
    ldr     r0, =message2
    bl      printf
    ldr     r0, =message3
    bl      printf

    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0,#0      @ Return 0.iiiiiii
    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.
message:
    .asciz  "clear skies, clean water\n"
message2: 
    .asciz "raspberry pi is not pie\n"
message3: 
    .asciz "corona is here\n"
