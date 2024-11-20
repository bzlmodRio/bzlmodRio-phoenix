#pragma once

#include <ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h>
#include <frc/controller/PIDController.h>
#include <frc/simulation/ElevatorSim.h>
#include <frc2/command/Subsystem.h>
#include <units/length.h>

class Elevator : public frc2::Subsystem {
 public:
  Elevator();

  void Stop();

  void SetVoltage(double output);

  void GoToHeight(units::meter_t height);

  bool IsAtHeight();

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetElevatorHeight();

 private:
  void Log();

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_motor;
  frc::PIDController m_controller;
  units::meter_t m_setpoint{0};

  // Sim
  frc::sim::ElevatorSim m_elevatorSim;
};
