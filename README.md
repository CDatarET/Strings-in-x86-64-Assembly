# Strings-in-x86-64-Assembly

This project implements basic string operations using **x86-64 Assembly** (Intel syntax) on Linux. It demonstrates low-level manipulation of strings using system calls and registers.

## Features

- **Input**: Accepts user input via syscall and stores it in memory.
- **Concatenation**: Concatenates two strings and displays the result.
- **Count Spaces**: Counts the number of space characters (`' '`) in the input string.
- **Count Words**: Counts the number of words in the input string (words are separated by spaces).

---

## Components

### 1. Input
Reads a string from the user using `sys_read`. Stores the input in a buffer for further operations.

### 2. Concatenation
Takes two input strings, appends the second to the first, and displays the concatenated result using `sys_write`.

### 3. Count Spaces
Iterates through the string byte by byte and counts how many space characters (`0x20`) are present.

### 4. Count Words
Counts words by detecting transitions from space to non-space characters. Handles multiple consecutive spaces and leading/trailing spaces properly.

---

## Requirements

- Linux OS
- `nasm` (Netwide Assembler)
- `ld` (GNU Linker) or `gcc` for linking

---

## How to Build and Run

```bash
nasm -f elf64 -o strings.o strings.asm
ld -o strings strings.o
./strings
