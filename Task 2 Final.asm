org 100h
include emu8086.inc
.data
    num db 0
    counter db 0
    incrementer db 2
    term db 2
    
.code
main proc
    call scan_num
    mov num,cl
    
    loop:mov bl,counter
         cmp bl,num
             je end 
         mov al, term
         call print_num
         print 0dh
         print 0ah
         
         add term,2
         add counter,1
         jmp loop
             
             
    end:
    


DEFINE_PRINT_NUM
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS    
end mainp
main end