#ifndef BUTTON
#define BUTTON

#include <ibutton.h> // for IButton

template<typename Port, int pinNumber>
class Button : public IButton
{
public:
  bool IsPressed() const override
  {
    return ((Port::IDR::Get()&(1 << pinNumber))!=(1 << pinNumber));
  }
};

#endif