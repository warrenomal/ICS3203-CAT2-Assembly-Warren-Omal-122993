Task 1:
This program classifies a number as `POSITIVE`, `NEGATIVE`, or `ZERO` based on user input. It demonstrates the use of conditional and unconditional jumps for control flow in assembly language.

1. Save the code as `task1.asm`.
2. Compile the code using NASM:
   ```bash
   nasm -f elf32 -o task1.o task1.asm
   
3. Link the object file:
```bash
  ld -m elf_i386 -o task1 task1.o
```
4. Run the program:
```bash
  ./task1
```

Task 2:
This program accepts an array of integers from the user, reverses the array in place using a loop, and then displays the reversed array. It showcases memory manipulation and the use of loops for array manipulation.

1. Save the code as task2.asm.
2. Compile the code:
```bash
  nasm -f elf32 -o task2.o task2.asm
```

3. Link the object file:
```bash
  ld -m elf_i386 -o task2 task2.o
```
5. Run the program:
```bash
  ./task2
```

Task 3:
This program computes the factorial of a number using a subroutine. It demonstrates the use of recursion and stack management in assembly language, along with modular program design.

1. Save the code as task3.asm.
2. Compile the code:
```bash
  nasm -f elf32 -o task3.o task3.asm
```
3. Link the object file:
```bash
  ld -m elf_i386 -o task3 task3.o
```
4.Run the program:
```bash
  ./task3
```

Task 4:
This program simulates a control system that reads a sensor value from an input and performs actions such as turning on a motor or triggering an alarm based on that value. It highlights the use of control flow and conditional logic in assembly for hardware simulation.

1. Save the code as task4.asm.
2. Compile the code:
``` bash
  nasm -f elf32 -o task4.o task4.asm
```
3.Link the object file:
```bash
  ld -m elf_i386 -o task4 task4.o
```
4. Run the program:
```bash
  ./task4
```