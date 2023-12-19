include emu8086.inc
org 100h
.data 
    nums db 5 DUP (?)
    sum db 0 
    avg db 0
    gA db 0
    eA db 0
    lineBreak db 0dh,0ah,'$'


.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov si,0
    loop:cmp si,5
         je sumPart
         
         call scan_num
         mov nums[si],cl
         print 0ah
         inc si
         jmp loop 
    
    
    sumPart:
    mov si,0 
    mov al, nums[si+0]
    add al, nums[si+1]
    add al, nums[si+2]
    add al, nums[si+3]
    add al, nums[si+4] 
    mov sum, al
    
    
    mov al,nums[4]
    cmp nums[0],al
        je secondCondition 
        jmp falseBlock
        
    secondCondition:
        mov al,nums[3]
        cmp nums[1],al
            je trueBlock
            jmp falseBlock
        
    trueBlock:
        mov dx,offset lineBreak
        mov ah,9
        int 21h
        
        mov ax,0
        mov al,sum
        call print_num 
        jmp end 
        
    falseBlock:
        mov ax,0
        mov al,sum
        mov bl,5
        div bl
        
        mov avg,al
        
        mov si, 0
        loop1: cmp si,5
               je loop1End
               
               mov al, nums[si]
               cmp avg, al
                   je equalBlock
               cmp avg,al
                   jg greaterBlock
               cmp avg,al
                   jl lesserBlock
               
               equalBlock:
                   inc eA
                   inc si
                   jmp loop1
                   
               greaterBlock:
                   inc gA
                   inc si
                   jmp loop1 
                   
               lesserBlock:
                   inc si
                   jmp loop1
      
        
        loop1End:
        mov al, avg
        call print_num
        print 0ah
        print 0dh
        mov al, gA
        call print_num
        print 0ah
        print 0dh 
        mov al,eA
        call print_num
             
    end: 
    print 0ah
    print 0dh
    print "End"
       
        
                  
    
    
    
    



DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS    
end mainp
main end