section .data
    prompt db 'Enter 5 integers (space-separated): ', 0
    output_prompt db 'Reversed Array: ', 0
    newline db 10, 0
    space db ' ', 0
    format db '%d', 0

section .bss
    array resq 5
    buffer resb 20

section .text
    extern scanf
    extern printf

    global main

main:
    ; Preserve stack alignment
    push rbp
    mov rbp, rsp

    ; Print input prompt
    mov rdi, prompt
    call printf

    ; Read 5 integers
    mov r12, 0  ; counter

input_loop:
    ; Prepare scanf arguments
    mov rdi, format
    mov rsi, buffer
    call scanf

    ; Store input in array
    mov rax, [buffer]
    mov [array + r12 * 8], rax

    inc r12
    cmp r12, 5
    jl input_loop

    ; Reverse array
    mov rcx, 2    ; loop count (array length / 2)
    mov rsi, 0    ; start index
    mov rdi, 4    ; end index

reverse_loop:
    ; Swap elements
    mov rax, [array + rsi * 8]
    mov rbx, [array + rdi * 8]
    mov [array + rsi * 8], rbx
    mov [array + rdi * 8], rax

    inc rsi
    dec rdi
    dec rcx
    jnz reverse_loop

    ; Print reversed array
    mov rdi, output_prompt
    call printf

    ; Print each reversed element
    mov r12, 0
print_loop:
    mov rdi, format
    mov rsi, [array + r12 * 8]
    call printf

    ; Print space
    mov rdi, space
    call printf

    inc r12
    cmp r12, 5
    jl print_loop

    ; Print newline
    mov rdi, newline
    call printf

    ; Exit
    xor rax, rax
    pop rbp
    ret