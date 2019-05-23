# x86-mastery
Заклинание кода

## Об ассемблере FASM
Сведения о синтаксисе FASM, необходимые в моих проектах.

### Метки и переменные
Использование метки или имени переменной в инструкциях означает использование адреса, а для обращения к значению, находящемуся по этому адресу в памяти, необходимо заключить имя в квадратные скобки:

- Поместить в `eax` адрес переменной
`mov eax, var`