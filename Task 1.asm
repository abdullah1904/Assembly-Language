include emu8086.inc
org 100h
.data                                          
    firstMessage dw "Enter First Number: ",'$' 
    secondMessage dw "Enter Second Number: ",'$'
    thirdMessage dw "Enter Third Number: ",'$'
    fourthMessage dw "Enter Fourth Number: ",'$'
    fifthMessage dw "Enter Fifth Number: ",'$'
    lineBreak dw 0dh,0ah,'$'
    firstNumber dw 0 
    secondNumber dw 0 
    thirdNumber dw 0 
    fourthNumber dw 0 
    fifthNumber dw 0  
    result dw 0
.code
main proc
     mov ax, @data
     mov ds,ax
     
     mov dx,offset firstMessage
     mov ah,9
     int 21h
     call scan_num
     mov firstNumber,cx
     mov dx, offset lineBreak
     mov ah,9
     int 21h 
     
     mov dx,offset secondMessage
     mov ah,9
     int 21h
     call scan_num
     mov secondNumber,cx
     mov dx, offset lineBreak
     mov ah,9
     int 21h
     
     mov dx,offset thirdMessage
     mov ah,9
     int 21h
     call scan_num
     mov thirdNumber,cx
     mov dx, offset lineBreak
     mov ah,9
     int 21h
     
     mov dx,offset fourthMessage
     mov ah,9
     int 21h
     call scan_num
     mov fourthNumber,cx
     mov dx, offset lineBreak
     mov ah,9
     int 21h
     
     mov dx,offset fifthMessage
     mov ah,9
     int 21h
     call scan_num
     mov fifthNumber,cx
     mov dx, offset lineBreak
     mov ah,9
     int 21h 
     
     mov ax,result
     add ax, firstNumber
     add ax, secondNumber
     add ax, thirdNumber
     add ax, fourthNumber
     add ax, fifthNumber
     call print_num
     


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end mainp
main end