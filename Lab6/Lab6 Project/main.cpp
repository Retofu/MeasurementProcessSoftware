#include "rccregisters.hpp" // for RCC
#include "gpioaregisters.hpp" // for GPIOA
#include "pin.h" // for LED toggle
#include "button.h" // for reсord button push 
#include "gpiocregisters.hpp" // for GPIOC
#include "treemode.h" // for TreeMode
#include "chessmode.h" // for ChessMode
#include "allflickmode.h" // for AllFlickMode
#include "garland.h" // for Garland work

void delay(int cycles)
{
  for(int i = 0; i < cycles; ++i)
  {
    asm volatile("");
  }
}

Pin<GPIOA,5> pin1 ;
Pin<GPIOC,9> pin2 ;
Pin<GPIOC,8> pin3 ;
Pin<GPIOC,5> pin4 ;
TreeMode<pin1, pin2, pin3, pin4> treeMode;
ChessMode<pin1, pin2, pin3, pin4> chessMode;
AllFlickMode<pin1, pin2, pin3, pin4> allflickMode;
Garland<allflickMode, treeMode, chessMode> garland;
Button<GPIOC, 13> button;

int main()
{
  GPIOC::MODER::MODER13::Input::Set() ;
  //Подать тактирование на порт А
  RCC::AHB1ENR::GPIOAEN::Enable::Set() ;
  //Подать тактирование на порт С
  RCC::AHB1ENR::GPIOCEN::Enable::Set() ;
  GPIOA::MODER::MODER5::Output::Set() ; // установить порт А.5 на выход
  //Светодиоды на портах C.5,C.8, C.9 на выход
  GPIOC::MODER::MODER5::Output::Set() ;
  GPIOC::MODER::MODER8::Output::Set() ;
  GPIOC::MODER::MODER9::Output::Set() ;
  
  for(;;)
  {
    garland.Update();
    if(button.IsPressed())
    {
      garland.NextMode();
    }
    delay(2500000);
  }
  
  return 1;
}