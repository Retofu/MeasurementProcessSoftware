#include "rccregisters.hpp" // for RCC
#include "gpioaregisters.hpp" // for GPIOA
#include "gpiocregisters.hpp" // for GPIOС

std::uint32_t SystemCoreClock = 16'000'000U;

void delay(int cycles)
{
  for(int i = 0; i < cycles; ++i)    
  {   
    asm volatile("");
  }    
}

int main()
{  
  //Подать тактирование на порт А
  RCC::AHB1ENR::GPIOAEN::Enable::Set() ;
  //Подать тактирование на порт С
  RCC::AHB1ENR::GPIOCEN::Enable::Set() ;
  //Порта А.5 на вывод
  GPIOA::MODER::MODER5::Output::Set() ;
  //Порта C.5,C.8, C.9 на вывод
  GPIOC::MODER::MODER5::Output::Set() ;
  GPIOC::MODER::MODER8::Output::Set() ;
  GPIOC::MODER::MODER9::Output::Set() ;
  
  for(;;)
  {
   
     GPIOA::ODR::ODR5::High::Set();
     GPIOC::ODR::ODR5::High::Set();
     delay(1000000); 
     GPIOA::ODR::ODR5::Low::Set();
     GPIOC::ODR::ODR5::Low::Set();
     delay(1000000); 
  }
}