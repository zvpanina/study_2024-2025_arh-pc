;--------------------------------------------------------------------
; Программа вычисления суммы значенийфункции f(x) для 𝑥 =𝑥1,𝑥2,...,𝑥n
;--------------------------------------------------------------------
%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = 15x + 2", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
mov eax, msg_func
call sprintLF

pop ecx
pop edx
sub ecx, 1
mov esi, 0

next:
cmp ecx, 0h
jz _end
pop eax
call atoi

call _calcul

add esi, eax
loop next

_end: 
mov eax, msg_result
call sprint
mov eax, esi
call iprintLF
call quit

_calcul:
mov ebx, 15
mul ebx
add eax, 2
ret
