#pragma once

#include <ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h>
#include <ctre/phoenix/sensors/WPI_PigeonIMU.h>
#include <frc/ADXRS450_Gyro.h>
#include <frc/drive/DifferentialDrive.h>
#include <frc/kinematics/DifferentialDriveOdometry.h>
#include <frc/simulation/ADXRS450_GyroSim.h>
#include <frc/simulation/DifferentialDrivetrainSim.h>
#include <frc/smartdashboard/Field2d.h>
#include <frc2/command/SubsystemBase.h>
#include <units/length.h>
#include <units/velocity.h>

class DriveTrain : public frc2::SubsystemBase {
 public:
  DriveTrain();

  void ArcadeDrive(double throttle, double rotation);

  double GetHeadingDegrees();
  frc::Rotation2d GetRotation();

  void Reset();

  double GetAverageDistance();

  void UpdateOdometry();

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetLeftEncoderDistance();
  units::meter_t GetRightEncoderDistance();

  units::meters_per_second_t GetLeftEncoderVelocity();
  units::meters_per_second_t GetRightEncoderVelocity();

 private:
  void Log();

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_leftMotorA;
  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_leftMotorB;

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_rightMotorA;
  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_rightMotorB;

  ctre::phoenix::sensors::WPI_PigeonIMU m_gyro;

  frc::DifferentialDrive m_robotDrive;

  frc::DifferentialDriveOdometry m_odometry;
  frc::Field2d m_field;

  // Simulation
  frc::sim::DifferentialDrivetrainSim m_drivetrainSimulator;
};
