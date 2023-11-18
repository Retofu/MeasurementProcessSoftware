#ifndef TREEMODE
#define TREEMODE

#include "imode.h" // for IMode
#include <array>

template<auto&...pins>
class TreeMode : public IMode
{
public:
  void Update() override
  {
    leds[currentLed++]->Toggle();
    if(currentLed == leds.size())
    {
      currentLed = 0;
    }
  }
  void Clear() override
  {
    currentLed = 0;
    for(auto it: leds)
    {
      it->Off();
    }
  }
private:
  std::size_t currentLed = 0;
  std::array<IPin*, sizeof ...(pins)> leds = {&pins...};
};

#endif