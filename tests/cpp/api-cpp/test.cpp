
#include <chrono>
#include <iostream>
#include <thread>

#include "ctre/phoenix/motorcontrol/can/TalonSRX.h"
#include "ctre/phoenix/motorcontrol/can/VictorSPX.h"
#include "ctre/phoenix/sensors/CANCoder.h"
#include "ctre/phoenix/sensors/PigeonIMU.h"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  ctre::phoenix::motorcontrol::can::TalonSRX talonSrx{3};
  ctre::phoenix::motorcontrol::can::VictorSPX victorSpx{3};
  ctre::phoenix::sensors::CANCoder cancoder{3};
  ctre::phoenix::sensors::PigeonIMU pigeon{3};

  std::cout << "Running  some loops" << std::endl;
  for (int i = 0; i < 500; ++i) {
    std::this_thread::sleep_for(std::chrono::microseconds(20));
  }
  std::cout << "Done" << std::endl;
}
