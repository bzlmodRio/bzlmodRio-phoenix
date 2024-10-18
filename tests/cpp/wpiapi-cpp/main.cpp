
#include <chrono>
#include <iostream>
#include <thread>

#include "ctre/Phoenix.h"
#include "ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h"
#include "ctre/phoenix/motorcontrol/can/WPI_VictorSPX.h"

int main() {
  std::cout << "Hello World" << std::endl;

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX talonSrx{3};
  ctre::phoenix::motorcontrol::can::WPI_VictorSPX victorSpx{3};

  std::cout << "Running  some loops" << std::endl;
  for (int i = 0; i < 500; ++i) {
    std::this_thread::sleep_for(std::chrono::microseconds(20));
  }
  std::cout << "Done" << std::endl;

  return 0;
}
