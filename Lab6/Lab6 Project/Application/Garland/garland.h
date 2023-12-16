#ifndef GARLAND
#define GARLAND

#include "imode.h" // for IMode
#include <array>

template<auto& ...presets>
class Garland
{
public:
  void NextMode()
  {
    pCurrentMode->SetToDefault();
    pCurrentMode = mod[i];
    i++;
    if(i == mod.size())
    {
      i = 0;
    }
  }
  void Update()
  {
    pCurrentMode->Update();
  }
private:
  std::size_t i = 0;
  std::array<IMode*, sizeof ...(presets)> mod = {&presets...};
  IMode* pCurrentMode = mod[0];
};
#endif