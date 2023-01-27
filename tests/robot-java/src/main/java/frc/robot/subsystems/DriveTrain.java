// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import edu.wpi.first.wpilibj.ADXRS450_Gyro;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
import edu.wpi.first.math.kinematics.DifferentialDriveOdometry;
import edu.wpi.first.wpilibj.simulation.ADXRS450_GyroSim;
import edu.wpi.first.wpilibj.simulation.DifferentialDrivetrainSim;
import edu.wpi.first.wpilibj.smartdashboard.Field2d;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;
import edu.wpi.first.hal.SimDouble;
import edu.wpi.first.wpilibj.simulation.SimDeviceSim;
import com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX;

public class DriveTrain extends SubsystemBase {

  private final WPI_TalonSRX m_leftLeader;
  private final WPI_TalonSRX m_leftFollower;
  private final WPI_TalonSRX m_rightLeader;
  private final WPI_TalonSRX m_rightFollower;

  private final DifferentialDrive m_drive;

  private final ADXRS450_Gyro m_gyro;

  private final DifferentialDriveOdometry m_odometry;
  private final Field2d m_field;

  // Sim
  private ADXRS450_GyroSim m_gyroSim;
  private DifferentialDrivetrainSim m_drivetrainSimulator;

  public DriveTrain() {
    m_leftLeader = new WPI_TalonSRX(PortMap.kDrivetrainMotorLeftAPort);
    m_leftFollower = new WPI_TalonSRX(PortMap.kDrivetrainMotorLeftBPort);
    m_rightLeader = new WPI_TalonSRX(PortMap.kDrivetrainMotorRightAPort);
    m_rightFollower = new WPI_TalonSRX(PortMap.kDrivetrainMotorRightBPort);

    m_drive = new DifferentialDrive(m_leftLeader, m_rightLeader);

    m_gyro = new ADXRS450_Gyro();

    m_odometry = new DifferentialDriveOdometry(m_gyro.getRotation2d(), 0, 0);
    m_field = new Field2d();

    SmartDashboard.putData("Field", m_field);

    if(RobotBase.isSimulation()) {
      m_gyroSim = new ADXRS450_GyroSim(m_gyro);

      m_drivetrainSimulator = DifferentialDrivetrainSim.createKitbotSim(
              DifferentialDrivetrainSim.KitbotMotor.kDualCIMPerSide,
              DifferentialDrivetrainSim.KitbotGearing.k12p75,
              DifferentialDrivetrainSim.KitbotWheelSize.kSixInch,
              null);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Left Distance", m_leftLeader.getSelectedSensorPosition());
    SmartDashboard.putNumber("Right Distance", m_rightLeader.getSelectedSensorPosition());
    SmartDashboard.putNumber("Left Speed", m_leftLeader.getSelectedSensorVelocity());
    SmartDashboard.putNumber("Right Speed", m_rightLeader.getSelectedSensorVelocity());
    SmartDashboard.putNumber("Gyro", m_gyro.getAngle());
  }

  public void arcadeDrive(double throttle, double rotation) {
    m_drive.arcadeDrive(throttle, rotation);
  }

  public double getHeading() {
    return m_gyro.getAngle();
  }

  /** Reset the robots sensors to the zero states. */
  public void reset() {
    m_gyro.reset();
    m_leftLeader.setSelectedSensorPosition(0);
    m_rightLeader.setSelectedSensorPosition(0);
  }

  public double getAverageDistance() {
    return (m_leftLeader.getSelectedSensorPosition() + m_rightLeader.getSelectedSensorPosition()) / 2;
  }

  void updateOdometry() {
    m_odometry.update(m_gyro.getRotation2d(), m_leftLeader.getSelectedSensorPosition(), m_rightLeader.getSelectedSensorPosition());
    m_field.setRobotPose(m_odometry.getPoseMeters());
  }

  @Override
  public void periodic() {
    updateOdometry();
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_drivetrainSimulator.setInputs(
            m_leftLeader.get() * RobotController.getInputVoltage(),
            m_rightLeader.get() * RobotController.getInputVoltage());
    m_drivetrainSimulator.update(0.02);

    m_leftLeader.getSimCollection().setQuadratureRawPosition((int)
            m_drivetrainSimulator.getLeftPositionMeters());
    m_leftLeader.getSimCollection().setQuadratureVelocity((int)
            m_drivetrainSimulator.getLeftVelocityMetersPerSecond());
    m_rightLeader.getSimCollection().setQuadratureRawPosition((int)
            m_drivetrainSimulator.getRightPositionMeters());
    m_rightLeader.getSimCollection().setQuadratureVelocity((int)
            m_drivetrainSimulator.getRightVelocityMetersPerSecond());
    m_gyroSim.setAngle(-m_drivetrainSimulator.getHeading().getDegrees());
  }

  public void stop() {
    m_leftLeader.set(0);
    m_rightLeader.set(0);
  }
}
