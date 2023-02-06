#pragma once

#include <ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h>
#include <frc/simulation/ElevatorSim.h>
#include <frc2/command/PIDSubsystem.h>
#include <units/length.h>

class Elevator : public frc2::PIDSubsystem {
public:
  Elevator();

  void Stop();

  double GetMeasurement() override;

  void UseOutput(double output, double setpoint) override;

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetElevatorHeight();

private:
  void Log();

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_motor;
  double m_setpoint{0};

  // Sim
  frc::sim::ElevatorSim m_elevatorSim;
};
