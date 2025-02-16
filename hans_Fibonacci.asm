#Assignment 6 - MIPS Intermediate Problems
#Hans Gamlien fibonacci super cool assembly program
.data

prompt: .asciiz "Please enter a number: "
newline: .asciiz "\n"

.text
.globl main

main:

#Print the prompt

#syscall code 4 is print_string
li $v0, 4

la $a0, prompt

syscall

#Read integer input
li $v0, 5
        
syscall
#$t0 = n
move $t0, $v0

#Check if n == 0

beq $t0, $zero, exit_program

li $t1, 0          

li $t2, 1         

#Initialize counter
li $t3, 1         

#Check if n >= 1
bge $t0, $t3, print_f0

j exit_program  

print_f0:

move $a0, $t1  

li $v0, 1 

syscall

#Print newline
li $v0, 4

la $a0, newline

syscall

#Increment counter
addi $t3, $t3, 1   

bge $t0, $t3, print_f1

j exit_program

print_f1:
#$a0 = F1
move $a0, $t2      

#syscall code 1 is print_int
li $v0, 1         

syscall

li $v0, 4

la $a0, newline

syscall

#Increment counter

#count = 3
addi $t3, $t3, 1 

#Loop to compute and print Fibonacci numbers

fib_loop:
#if count > n, exit
bgt $t3, $t0, exit_program

#$t4 = F_next = F0 + F1
add $t4, $t1, $t2

#$a0 = F_next
move $a0, $t4       

#syscall code 1 is print_int
li $v0, 1           

syscall

li $v0, 4

la $a0, newline

syscall

#F0 = F1
move $t1, $t2

#F1 = F_next
move $t2, $t4

#count++
addi $t3, $t3, 1

j fib_loop

exit_program:

li $v0, 10
        
syscall
# don't enter number 99 unless you want the program to crash lol