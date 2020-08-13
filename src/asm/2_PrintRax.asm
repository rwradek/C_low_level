section .data                                                           
codes:                              
    db      '0123456789ABCDEF'      

section .text                       
global _start                       
_start:                         
    ; number 1122... in hexadecimal format
    mov rax, 0x1122334455667788    
    
    mov rdi, 1    ; SYSCALL-> arg1: file desc: 1 - stdio              
    mov rdx, 1    ; SYSCALL-> arg3: how many bytes to write              
    mov rcx, 64   ; rcx filled with default value 64 - max shift

	; Each 4 bits should be output as one hexadecimal digit
	; Use shift and bitwise AND to isolate them
	; the result is the offset in 'codes' array

.loop:           

    push rax        ; save current state of rax                    
    sub rcx, 4      ; rcx - 4 ( rcx -= 4 )
                      	; cl is a register, smallest part of rcx
	                      ; rax -- eax -- ax -- ah + al
	                      ; rcx -- ecx -- cx -- ch + cl
    sar rax, cl     ; shift right rax by cl -> loop(0) -> 60
                    ; (before) -> rax, 0x1122334455667788
                    ; (after l0)  -> rax, 0x0000000000000001
                    ; (after l1)  -> rax, 0x0000000000000011
    and rax, 0xf    ; clean unnecessary bytees
                    ; (after l0)  -> rax, 0x0000000000000001


    lea rsi, [codes + rax]  ; SYSCALL-> arg2: data to write   
                    ; load the character do display -> address of the character 
    mov rax, 1      ; SYSCALL-> system call number (1 - write)             


    ; syscall leaves rcx and r11 changed
    push rcx        ; save rcx                             
    syscall                     
    pop rcx          ; restore rcs


    pop rax         ; restore rax before operation    

	; test can be used for the fastest 'is it a zero?' check
	; see docs for 'test' command
    test rcx, rcx
    jnz .loop   
    
    mov     rax, 60            ; invoke 'exit' system call
    xor     rdi, rdi
    syscall



; GENERAL
  ; shr - logical shift. 
    ; It means that the bits that slide off the end disappear. 
    ; The exception is the last bit, which slides into the carry flag (CF). 
    ; The spaces are filled with zeros.

    ; mov rax, 0xFFFFFFFFFFFFFFFF      
    ; shr rax, 4                     ; rax = 0x0FFFFFFFFFFFFFFF

  ; sar- arithmetic shift
    ; mov rax, 0xFB00000000000000      
    ; shr rax, 4                     ; rax = 0xFFB0000000000000


  ; Local labels
    ; starts with dot -> .loop
      ; name may be resused
      ; full name is _start.loop