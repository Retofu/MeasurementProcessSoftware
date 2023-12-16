#ifndef IMODE
#define IMODE

class IMode
{
public:
  virtual void Update() = 0;
  virtual void SetToDefault() = 0;
};

#endif