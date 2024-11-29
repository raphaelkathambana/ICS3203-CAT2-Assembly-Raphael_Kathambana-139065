# ICS3203 CAT 2 - Assembly Programming Assignment

## Overview
This repository contains solutions for the Assembly Programming Assignment, implementing various tasks in 64-bit assembly.


## Tasks

### Task 1: Control Flow and Conditional Logic
**Objective**: Develop a program that classifies user-input numbers as POSITIVE, NEGATIVE, or ZERO.

**Requirements**:
- Prompt for user input
- Use branching logic for classification
- Implement both conditional and unconditional jumps
- Demonstrate effective program flow control


**Compilation (64-bit)**:
```bash
nasm -f elf64 number_classifier_64.asm
gcc -no-pie -m64 number_classifier_64.o -o number_classifier_64 -lc -l:libc.so -ldl
```

### Task 2: Array Manipulation with Reversal
**Objective**: Create a program to reverse an array of integers in-place.

**Requirements**:
- Accept 5 integer inputs from the user
- Reverse the array without using additional memory
- Use loops for array manipulation
- Output the reversed array

**Compilation (64-bit)**:
```bash
nasm -f elf64 array_reversal_64.asm
gcc -no-pie -m64 array_reversal_64.o -o array_reversal_64 -lc -l:libc.so -ldl
```

### Task 3: Factorial Calculation with Subroutines
**Objective**: Develop a modular program to compute factorial of a given number.

**Requirements**:
- Create a separate subroutine for factorial calculation
- Use stack to preserve registers
- Demonstrate modular code design
- Place final result in a general-purpose register

**Compilation (64-bit)**:
```bash
nasm -f elf64 factorial_64.asm
gcc -no-pie -m64 factorial_64.o -o factorial_64 -lc -l:libc.so -ldl
```

### Task 4: Data Monitoring and Control Simulation
**Objective**: Create a control program simulating sensor-based water level monitoring.

**Requirements**:
- Read simulated sensor value from memory/input port
- Implement logic for:
  1. Triggering alarm for high water levels
  2. Stopping motor for moderate levels
  3. Running motor for low levels


**Compilation (64-bit)**:
```bash
nasm -f elf64 water_control_64.asm
gcc -no-pie -m64 water_control_64.o -o water_control_64 -lc -l:libc.so -ldl
```

## Documentation Requirements
Each source file includes:
- Detailed comments explaining program logic
- Rationale for instruction choices
- Explanation of control flow
- Insights into memory and register management

## Learning Outcomes
- Low-level system programming
- Assembly language fundamentals
- Architecture-specific programming
- Control flow and memory management