$INCLUDE (REG51.INC)

LED      BIT P1.0   
BUZZER   BIT P1.1   
TIMEOUT  EQU 30H    

ORG 0000H          
LJMP MAIN

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

    SJMP $      
END
