#ifndef IPIN
#define IPIN

class IPin
{
public:
  virtual void Toggle() const = 0; 
  virtual void Off() const = 0; 
};

#endif