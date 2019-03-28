global _start
section .text
_start:

mov rax,2           ;syscall open 
mov rdi,helloworld  ;pointer to hello.txt
mov rsi,0x001       ;specifying the open flag as writeonly|create_if_not_exist
or  rsi,0x040       
mov rdx,0x1b6       ;specifying the file permission as 666
syscall             ;execute syscall
mov rdi,rax         ;saving returned file discriptor to rdi
mov rax,1           ;choose syscall write
mov rsi,dataw       ;pointer to dataw below
mov rdx,len         ;pass length of above string
sub rdx,1           ;subtract 1 so that it doesnot write nullbyte
syscall
mov rax,60          ;specifying syscall exit
mov rdi,0           ;set exit value as 0
syscall

section .data
dataw: db "This file was created via assembly",0xa,0x0
len: equ $-dataw
helloworld: db "hello.txt",0x0

