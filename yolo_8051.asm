$INCLUDE (REG51.INC)
LED     BIT P1.0    
BUZZER  BIT P1.1    
TIMEOUT EQU 30H      

ORG 0000H            
LJMP MAIN

ORG 000BH            
LJMP T0_ISR

ORG 0023H            
LJMP UART_ISR

ORG 0100H
MAIN:
    MOV SP, #60H     
    MOV TMOD, #21H   
    MOV TH0, #3CH    
    MOV TL0, #0B0H
    MOV TIMEOUT, #0  
    CLR LED
    CLR BUZZER
    MOV TH1, #0FDH   
    MOV SCON, #50H   
    SETB TR1         

    SETB ET0         
    SETB ES          
    SETB EA          
    SETB TR0         

    SJMP $           

UART_ISR:
    JNB RI, EXIT_UART      
    MOV A, SBUF            
    CLR RI                 
    CJNE A, #'A', EXIT_UART 
    
    SETB LED               
    SETB BUZZER            
    MOV TIMEOUT, #20       
EXIT_UART:
    RETI

T0_ISR:
    MOV TH0, #3CH          
    MOV TL0, #0B0H
    MOV A, TIMEOUT
    JZ EXIT_T0             
    
    DEC TIMEOUT            
    MOV A, TIMEOUT
    JNZ EXIT_T0            
    
    CLR LED                
    CLR BUZZER
EXIT_T0:
    RETI

END
