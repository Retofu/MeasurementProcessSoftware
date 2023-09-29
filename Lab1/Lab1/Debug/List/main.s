///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V9.30.1.335/W64 for ARM        29/Sep/2023  15:37:33
// Copyright 1999-2022 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\work\Lab1\main.cpp
//    Command line =
//        -f F:\work\Lab1\Debug\Obj\main.o.rsp (F:\work\Lab1\main.cpp -lC
//        F:\work\Lab1\Debug\List\ -lA F:\work\Lab1\Debug\List\ -o
//        F:\work\Lab1\Debug\Obj\ --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4 -e --fpu=VFPv4_sp --dlib_config
//        "C:\Program Files\IAR Systems\Embedded Workbench
//        9.1\arm\inc\c\DLib_Config_Normal.h" -I F:\work\Lab1\Common\ -I
//        F:\work\Lab1\AHardware\Registers\STM32F411\FieldValues\ -I
//        F:\work\Lab1\AHardware\Registers\STM32F411\ -I
//        F:\work\Lab1\AHardware\Registers\ -I
//        F:\work\Lab1\AHardware\Registers\CortexM4\ -I
//        F:\work\Lab1\AHardware\Registers\CortexM4\FieldValues\ -On --c++
//        --no_exceptions --no_rtti) --dependencies=n
//        F:\work\Lab1\Debug\Obj\main.o.d
//    Locale       =  C
//    List file    =  F:\work\Lab1\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__CPP_Exceptions", "Disabled"
        RTMODEL "__CPP_Language", "C++14"
        RTMODEL "__CPP_Library", "DLib"
        RTMODEL "__CPP_Runtime", "1"
        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__dlib_version", "6"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC SystemCoreClock
        PUBLIC _Z5delayi
        PUBLIC main
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI Resource D0:64, D1:64, D2:64, D3:64, D4:64, D5:64, D6:64, D7:64
          CFI Resource D8:64, D9:64, D10:64, D11:64, D12:64, D13:64, D14:64
          CFI Resource D15:64
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI D0 Undefined
          CFI D1 Undefined
          CFI D2 Undefined
          CFI D3 Undefined
          CFI D4 Undefined
          CFI D5 Undefined
          CFI D6 Undefined
          CFI D7 Undefined
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI D11 SameValue
          CFI D12 SameValue
          CFI D13 SameValue
          CFI D14 SameValue
          CFI D15 SameValue
          CFI EndCommon cfiCommon0
        
// F:\work\Lab1\main.cpp
//    1 #include "rccregisters.hpp" // for RCC
//    2 #include "gpioaregisters.hpp" // for GPIOA
//    3 #include "gpiocregisters.hpp" // for GPIOС
//    4 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//    5 std::uint32_t SystemCoreClock = 16'000'000U;
SystemCoreClock:
        DATA32
        DC32 16'000'000
//    6 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function _Z5delayi
          CFI NoCalls
        THUMB
//    7 void delay(int cycles)
//    8 {
//    9   for(int i = 0; i < cycles; ++i)    
_Z5delayi:
        MOVS     R1,#+0         
??delay_0:
        CMP      R1,R0          
        BGE.N    ??delay_1      
//   10   {   
//   11     asm volatile("");
        ADDS     R1,R1,#+1      
        B.N      ??delay_0      
//   12   }    
//   13 }
??delay_1:
        BX       LR             
          CFI EndBlock cfiBlock0
//   14 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function main
        THUMB
//   15 int main()
//   16 {  
main:
        PUSH     {R3-R9,LR}     
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
//   17   //Подать тактирование на порт А
//   18   RCC::AHB1ENR::GPIOAEN::Enable::Set() ;
        LDR.N    R1,??DataTable1
        LDR      R0,[R1, #+0]   
        ORRS     R2,R0,#0x1     
        STR      R2,[R1, #+0]   
//   19   //Подать тактирование на порт С
//   20   RCC::AHB1ENR::GPIOCEN::Enable::Set() ;
        LDR      R2,[R1, #+0]   
        ORRS     R3,R2,#0x4     
        STR      R3,[R1, #+0]   
//   21   //Порта А.5 на вывод
//   22   GPIOA::MODER::MODER5::Output::Set() ;
        LDR.N    R3,??DataTable1_1
        LDR      R1,[R3, #+0]   
        BICS     R4,R1,#0xC00   
        ORRS     R4,R4,#0x400   
        STR      R4,[R3, #+0]   
//   23   //Порта C.5,C.8, C.9 на вывод
//   24   GPIOC::MODER::MODER5::Output::Set() ;
        LDR.N    R4,??DataTable1_2
        LDR      R3,[R4, #+0]   
        BICS     R5,R3,#0xC00   
        ORRS     R5,R5,#0x400   
        STR      R5,[R4, #+0]   
//   25   GPIOC::MODER::MODER8::Output::Set() ;
        LDR      R5,[R4, #+0]   
        BICS     R6,R5,#0x30000 
        ORRS     R6,R6,#0x10000 
        STR      R6,[R4, #+0]   
//   26   GPIOC::MODER::MODER9::Output::Set() ;
        LDR      R6,[R4, #+0]   
        BICS     R7,R6,#0xC0000 
        ORRS     R7,R7,#0x40000 
        STR      R7,[R4, #+0]   
//   27   
//   28   for(;;)
//   29   {
//   30    
//   31      GPIOA::ODR::ODR5::High::Set();
??main_0:
        LDR.N    R5,??DataTable1_3
        LDR      R4,[R5, #+0]   
        ORRS     R0,R4,#0x20    
        STR      R0,[R5, #+0]   
//   32      GPIOC::ODR::ODR5::High::Set();
        LDR.N    R6,??DataTable1_4
        LDR      R7,[R6, #+0]   
        ORRS     R0,R7,#0x20    
        STR      R0,[R6, #+0]   
//   33      delay(1000000); 
        LDR.W    R8,??DataTable1_5
        MOV      R0,R8          
          CFI FunCall _Z5delayi
        BL       _Z5delayi      
//   34      GPIOA::ODR::ODR5::Low::Set();
        LDR      R9,[R5, #+0]   
        BICS     R0,R9,#0x20    
        STR      R0,[R5, #+0]   
//   35      GPIOC::ODR::ODR5::Low::Set();
        LDR      R5,[R6, #+0]   
        BICS     R0,R5,#0x20    
        STR      R0,[R6, #+0]   
//   36      delay(1000000); 
        MOV      R0,R8          
          CFI FunCall _Z5delayi
        BL       _Z5delayi      
        B.N      ??main_0       
//   37   }
//   38 }
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DATA32
        DC32     0x40023830     

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DATA32
        DC32     0x40020000     

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DATA32
        DC32     0x40020800     

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DATA32
        DC32     0x40020014     

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DATA32
        DC32     0x40020814     

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DATA32
        DC32     0xf4240        

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   4 bytes in section .data
// 166 bytes in section .text
// 
// 166 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
