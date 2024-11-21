%include 'in_out.asm'

SECTION .data
msg1 db 'Введите В: ', 0h
msg2 db 'Наименьшее число: ', 0h
A dd '21'
C dd '34'

SECTION .bss
min resb 10
B resb 10

SECTION .text
GLOBAL _start
_start:
;--------------  Вывод сообщения 'Введите B: '
mov eax, msg1
call sprint
;--------------  Ввод 'B'
mov ecx, B
mov edx, 10
call sread
;--------------  Преобразование 'B' из символа в число
mov eax, B
call atoi        ; Вызов подпрограммы перевода символа в число
mov [B], eax     ; запись преобразованного числа в 'B'
;-----------  Записываем 'A' в переменную 'min'
mov ecx, [A]     ; 'ecx = A'
mov [min], ecx   ; 'min = A'
;-----------  Сравниваем 'A' и 'C' (как символы)
cmp ecx, [C]     ; Сравниваем 'A' и 'C'
jl check_B       ; если 'A<C', то переход на метку 'check_B'
mov ecx, [C]     ; иначе 'ecx = C'
mov [min], ecx   ; 'min = C'
;-----------  Преобразование 'min(A, C)' из символа в число
check_B:
mov eax, min
call atoi       ; Вызов подпрограммы перевода символа в число 
mov [min], eax  ; запись преобразованного числа в 'min'
;-----------  Сравниваем 'min(A,C)' и 'B' (как числа)
mov ecx, [min]
cmp ecx, [B]    ; Сравниваем 'min(A,C)' и 'B'
jl fin          ; Если 'min(A,C)>B', то переход на 'fin',
mov ecx, [B]    ; иначе 'ecx = B'
mov [min], ecx
;---------- Вывод результата
fin:
mov eax, msg2
call sprint    ; Вывод сообщения 'Наибольшее число: '
mov eax, [min]
call iprintLF  ; Вывод 'max(A,B,C)'
call quit      ; Выход
