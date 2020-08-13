global _start                             ; label - defined below -> jump place

section .data                             ; section holds gloal varaiable - data
message: db 'hello, world!', 10           ; message - label used by instruction
                                          ; 10 (at the end) - special character, line end

section .text                             ; section holds instruction

_start:                                   ; entry point
    mov     rax, 1          ; system call number should be stored in rax 
    mov     rdi, 1          ; argument #1 in rdi: where to write (descriptor)?
                            ; 0 - stdin, 1 - stdout, 2 - stderr
    mov     rsi, message    ; argument #2 in rsi: where does the string start? 
    mov     rdx, 14         ; argument #3 in rdx: how many bytes to write? 
    syscall                 ; this instruction invokes a system call

; If program ends here it cause - Segmentation fault.
; Processor does not know where program ends, we have to call "EXIT" sys call

    mov rax,60              ; 'exit' syscall
    xor rdi,rdi
    syscall



; General note:
; keywords: global, section, db - directives
; db - byte data
  ; db - bytes
  ; dw - word (2 bytes)
  ; dd - double words (4 bytes)
  ; dq - quad words ( 8 bytes)
; times n cmd - repeat cmd  n-times
; ex1: db 0,0,0,0,0
; ex2: times 5 db 0 

; Basic instruction - mov
  ; write value to: reister or memenory 
  ; take data from: register, memory, imidate value
    ; WARNING: cannot copy from memory to memory
    ; src i dest - must be the same size

; Syscall - wiadomo, argumenty w rejstrach w zależności od definicji syscall



