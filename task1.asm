section .data
    prompt db "Enter a number: ", 0
    positive_msg db "POSITIVE", 10, 0
    negative_msg db "NEGATIVE", 10, 0
    zero_msg db "ZERO", 10, 0

section .bss
    num resb 10     ; Increased buffer to handle negative numbers

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    ; Check for negative sign
    mov al, byte [num]
    cmp al, '-'
    je is_negative   ; If first character is '-', it's negative
    
    ; Convert to number and check if zero
    sub al, '0'
    cmp al, 0
    je is_zero
    jmp is_positive  ; If not negative and not zero, must be positive

is_positive:
    mov eax, 4
    mov ebx, 1
    mov ecx, positive_msg
    mov edx, 9       ; Length including newline
    int 0x80
    jmp exit

is_negative:
    mov eax, 4
    mov ebx, 1
    mov ecx, negative_msg
    mov edx, 9       ; Length including newline
    int 0x80
    jmp exit

is_zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, zero_msg
    mov edx, 5       ; Length including newline
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
