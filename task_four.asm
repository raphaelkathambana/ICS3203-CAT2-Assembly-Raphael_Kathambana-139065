section .data
    high_alarm db 'ALARM: Water level too high!', 10, 0
    moderate_msg db 'Water level moderate. Motor stopped.', 10, 0
    low_msg db 'Water level low. Motor running.', 10, 0

section .bss
    sensor_value resq 1
    motor_status resq 1

section .text
    global _start

_start:
    ; Simulate reading sensor value (simulated memory location)
    mov qword [sensor_value], 95  ; Example water level (0-100)

    ; Check water level conditions
    mov rax, [sensor_value]

    ; High water level (> 90)
    cmp rax, 90
    jg high_water_level

    ; Moderate water level (50-90)
    cmp rax, 50
    jge moderate_water_level

    ; Low water level (< 50)
    jmp low_water_level

high_water_level:
    ; Trigger alarm
    mov rax, 1
    mov rdi, 1
    mov rsi, high_alarm
    mov rdx, 27
    syscall

    ; Stop motor
    mov qword [motor_status], 0
    jmp exit

moderate_water_level:
    ; Output moderate message
    mov rax, 1
    mov rdi, 1
    mov rsi, moderate_msg
    mov rdx, 35
    syscall

    ; Stop motor
    mov qword [motor_status], 0
    jmp exit

low_water_level:
    ; Output low level message
    mov rax, 1
    mov rdi, 1
    mov rsi, low_msg
    mov rdx, 32
    syscall

    ; Start motor
    mov qword [motor_status], 1

exit:
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall