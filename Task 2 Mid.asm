org 100h
include emu8086.inc
.data
    firstMessage dw "Enter number for square and cube: "
    num dw 0
    sq dw 0
    cb dw 0
    lineBreak dw 0dh,0ah,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov dx, offset firstMessage
    mov ah,9
    int 21h
    
    call scan_num
    mov num, cx
    
    mov ax, num
    mov bx, num
    mul bx
    mov sq, ax
    mov ax, sq
    mov bx, num
    mul bx
    mov cb,ax 
    mov ax, sq
    call print_num
    mov ax, cb
    call print_num
    
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS     
end mainp
main end