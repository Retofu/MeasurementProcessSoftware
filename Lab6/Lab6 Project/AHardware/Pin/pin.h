#ifndef PIN
#define PIN

#include "ipin.h" // for IPin

template<typename Port, int pinNumber>
class Pin : public IPin
{
public:
  void Toggle() const override
  {
    Port::ODR::Toggle(1 << pinNumber) ;
  }
  void Off() const override
  {
    Port::ODR::Write(Port::ODR::Get()&~(1 << pinNumber));
  }
} ;

#endif