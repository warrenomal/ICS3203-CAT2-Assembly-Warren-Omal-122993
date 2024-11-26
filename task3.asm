section .data
    prompt db "Enter a number: ", 0        ; Prompt message
    result_msg db "Factorial is: ", 0       ; Result message

section .bss
    num resd 1                              ; Reserve space for the input number
    result resd 1                           ; Reserve space for the result

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; File descriptor (stdout)
    mov ecx, prompt       ; Address of the prompt message
    mov edx, 17           ; Length of the prompt
    int 0x80

    ; Read user input
    mov eax, 3            ; sys_read system call
    mov ebx, 0            ; File descriptor (stdin)
    mov ecx, num          ; Address of the input buffer
    mov edx, 4            ; Number of bytes to read
    int 0x80

    ; Convert ASCII input to integer
    mov eax, [num]        ; Load input value into EAX
    sub eax, '0'          ; Convert ASCII to integer

    ; Call factorial subroutine
    push eax              ; Push input number onto the stack
    call factorial        ; Call the factorial subroutine
    pop ebx               ; Restore the original number

    ; Store result in memory
    mov [result], eax     ; Store the result in 'result'

    ; Print result message
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; File descriptor (stdout)
    mov ecx, result_msg   ; Address of the result message
    mov edx, 12           ; Length of the result message
    int 0x80

    ; Print the result (not fully implemented in this example)
    ; You would need additional code to convert the result back to ASCII and display it

    ; Exit the program
    mov eax, 1            ; sys_exit system call
    xor ebx, ebx          ; Exit code 0
    int 0x80

; Factorial subroutine (recursively calculates factorial)
factorial:
    push ebp              ; Save the base pointer
    mov ebp, esp          ; Set up stack frame

    ; Base case: if n <= 1, return 1
    cmp eax, 1
    jle base_case         ; Jump to base case if n <= 1

    ; Recursive case: n * factorial(n-1)
    push eax              ; Save the current value of n
    dec eax               ; Decrement n
    call factorial        ; Recursive call
    pop ebx               ; Restore the original value of n

    ; Multiply the result by n
    mul ebx               ; EAX = EAX * EBX (current result * n)

    ; Restore stack and return
    mov esp, ebp          ; Restore stack pointer
    pop ebp               ; Restore base pointer
    ret                   ; Return from subroutine

base_case:
    mov eax, 1            ; Return 1 in the base case
    mov esp, ebp          ; Restore stack pointer
    pop ebp               ; Restore base pointer
    ret                   ; Return from subroutine

