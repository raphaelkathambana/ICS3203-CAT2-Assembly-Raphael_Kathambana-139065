section .data
    prompt db 'Enter a number to calculate factorial: ', 0
    format db '%d', 0
    result_format db 'Factorial result: %d', 10, 0

section .bss
    input resq 1

section .text
    extern scanf
    extern printf

    global main

main:
    ; Preserve stack alignment
    push rbp
    mov rbp, rsp

    ; Print prompt
    mov rdi, prompt
    call printf

    ; Read input
    mov rdi, format
    mov rsi, input
    call scanf

    ; Get input value
    mov rdi, [input]
    call factorial

    ; Print result
    mov rdi, result_format
    mov rsi, rax
    xor rax, rax
    call printf

    ; Exit
    xor rax, rax
    pop rbp
    ret

; Factorial subroutine
; Input: RDI (number to calculate factorial)
; Output: RAX (factorial result)
factorial:
    ; Base case: 0! or 1!
    cmp rdi, 1
    jle base_case

    ; Recursive case
    push rdi    ; Save current number
    dec rdi     ; Prepare for recursive call
    call factorial  ; Recursive call

    ; Multiply current number with previous factorial
    pop rdi     ; Restore current number
    imul rax, rdi  ; Multiply result by current number
    ret

base_case:
    mov rax, 1
    ret