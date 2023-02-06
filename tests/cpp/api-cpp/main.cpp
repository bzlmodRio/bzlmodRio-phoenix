
#include <chrono>
#include <iostream>
#include <thread>

#include "ctre/phoenix/motorcontrol/can/TalonFX.h"
#include "ctre/phoenix/motorcontrol/can/TalonSRX.h"
#include "ctre/phoenix/motorcontrol/can/VictorSPX.h"
#include "ctre/phoenix/sensors/CANCoder.h"
#include "ctre/phoenix/sensors/PigeonIMU.h"

int main() {
  std::cout << "Hello World" << std::endl;

  ctre::phoenix::motorcontrol::can::TalonFX talonFx{3};
  ctre::phoenix::motorcontrol::can::TalonSRX talonSrx{3};
  ctre::phoenix::motorcontrol::can::VictorSPX victorSpx{3};
  ctre::phoenix::sensors::CANCoder cancoder{3};
  ctre::phoenix::sensors::PigeonIMU pigeon{3};

  std::cout << "Running  some loops" << std::endl;
  for (int i = 0; i < 500; ++i) {
    std::this_thread::sleep_for(std::chrono::microseconds(20));
  }
  std::cout << "Done" << std::endl;

  return 0;
}
