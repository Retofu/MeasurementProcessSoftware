#ifndef CHESSMODE
#define CHESSMODE

#include "imode.h" // for IMode
#include <array> // for std::array

template<auto&...pins>
class ChessMode : public IMode
{
public:
  void Update() override
  {
    if(isOdd)
    {
      for(std::size_t i = 0; i < leds.size(); i+=2)
      {
        leds[i]->Toggle();
      }
    } else
    {
      for(auto it: leds)
      {
        it->Toggle();
      }
    }
    isOdd = false;
  }
  void Clear() override
  {
    isOdd = true;
    for(auto it: leds)
    {
      it->Off();
    }
  }
private:
  bool isOdd = true;
  std::array<IPin*, sizeof ...(pins)> leds = {&pins...};
};

#endif