include emu8086.inc
org 100h
.data
    var1 dw 0
    var2 dw 0
    result dw 1
.code
main proc
    call scan_num
    fac: inc var2
    mov ax, result
    mov bx, var2
    mul bx
    mov result, ax
    loop fac
    mov ax, result
    call print_num
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
    
end mainp 
main end