section .data
    prompt db "Enter a number: ", 0
    positive db "POSITIVE", 0
    negative db "NEGATIVE", 0
    zero db "ZERO", 0

section .bss
    number resb 8

section .text
    global _start

_start:
    ; Print prompt
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; file descriptor: stdout
    mov rsi, prompt
    mov rdx, 15             ; length of prompt
    syscall

    ; Read input
    mov rax, 0              ; syscall: read
    mov rdi, 0              ; file descriptor: stdin
    mov rsi, number         ; buffer
    mov rdx, 8              ; max length to read
    syscall

    ; Convert ASCII to integer (handle negative input)
    movzx rax, byte [number] ; Load first byte of input
    cmp rax, '-'            ; Check if negative
    jne check_zero_or_positive

    ; Handle negative number
    movzx rax, byte [number + 1] ; Load second byte of input
    sub rax, '0'            ; Convert to integer
    jmp classify_negative

check_zero_or_positive:
    sub rax, '0'            ; Convert to integer

    ; Check if zero
    cmp rax, 0
    je print_zero

    ; Check if positive
    jg print_positive

classify_negative:
    ; Print "NEGATIVE"
    mov rsi, negative
    jmp print_result

print_positive:
    ; Print "POSITIVE"
    mov rsi, positive
    jmp print_result

print_zero:
    ; Print "ZERO"
    mov rsi, zero

print_result:
    ; Print result
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; file descriptor: stdout
    mov rdx, 8              ; length of result
    syscall

    ; Exit program
    mov rax, 60             ; syscall: exit
    xor rdi, rdi
    syscall
