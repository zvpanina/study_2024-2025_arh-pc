%include 'in_out.asm'
SECTION .data
msg1: DB 'Введите значение переменной x: ', 0
msg2: DB 'Введите значение переменной a: ', 0
msg3: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg1
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov edi, eax

mov eax, msg2
call sprint
mov ecx, a
mov edx, 80
call sread
mov eax, a
call atoi
mov esi, eax

cmp esi, 0
jne add_values
mov eax, esi
mov ebx, 4
mul ebx
jmp print_result

add_values:
mov eax, esi
mov ebx, 4
mul ebx
add eax, edi

print_result:
mov edi, eax
mov eax, msg3
call sprint
mov eax, edi
call iprintLF
call quit
