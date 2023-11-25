#ifndef ALLFLICKMODE
#define ALLFLICKMODE

#include "imode.h" // for IMode
#include <array>

template<auto&...pins>
class AllFlickMode : public IMode
{
public:
  void Update() override
  {
    for(std::size_t i = 0; i < leds.size(); i++)
    {
      leds[i]->Toggle();
    }
  }
  void SetToDefault() override
  {
    for(auto it: leds)
    {
      it->Off();
    }
  }
private:
  std::array<IPin*, sizeof ...(pins)> leds = {&pins...};
};

#endif