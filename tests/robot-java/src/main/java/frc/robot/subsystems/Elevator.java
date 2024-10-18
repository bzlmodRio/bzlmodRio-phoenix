package frc.robot.subsystems;

import com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX;
import edu.wpi.first.math.controller.PIDController;
import edu.wpi.first.math.system.plant.DCMotor;
import edu.wpi.first.math.util.Units;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.simulation.ElevatorSim;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class Elevator extends SubsystemBase {
  private static final double kP = 4;
  private static final double kI = 0.0;
  private static final double kD = 0.0;

  private static final double kElevatorGearing = 10.0;
  private static final double kElevatorDrumRadius = Units.inchesToMeters(2);
  private static final double kCarriageMass = 4.0;

  private static final DCMotor kElevatorGearbox = DCMotor.getVex775Pro(4);
  private static final double kMinElevatorHeight = Units.inchesToMeters(0);
  private static final double kMaxElevatorHeight = Units.inchesToMeters(50);

  private final WPI_TalonSRX m_motor;
  private final PIDController m_controller;

  private double m_setpoint;

  // Sim
  private ElevatorSim m_elevatorSim;

  /** Create a new elevator subsystem. */
  @SuppressWarnings("this-escape")
  public Elevator() {
    m_controller = new PIDController(kP, kI, kD);
    m_motor = new WPI_TalonSRX(PortMap.kElevatorMotorPort);

    m_controller.setTolerance(0.005);

    if (RobotBase.isSimulation()) {
      m_elevatorSim =
          new ElevatorSim(
              kElevatorGearbox,
              kElevatorGearing,
              kCarriageMass,
              kElevatorDrumRadius,
              kMinElevatorHeight,
              kMaxElevatorHeight,
              true,
              0);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Elevator Height", m_motor.getSelectedSensorPosition());
  }

  public void setVoltage(double output) {
    m_motor.set(output);
  }

  public void goToHeight(double height) {
    double pidVoltage = m_controller.calculate(m_motor.getSelectedSensorPosition(), height);
    setVoltage(pidVoltage);
  }

  public boolean isAtHeight() {
    double error = m_setpoint - m_motor.getSelectedSensorPosition();
    return error < 0.5;
  }

  @Override
  public void periodic() {
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_elevatorSim.setInput(m_motor.get() * RobotController.getInputVoltage());
    m_elevatorSim.update(0.02);
    m_motor.getSimCollection().setQuadratureRawPosition((int) m_elevatorSim.getPositionMeters());
  }

  public void stop() {
    m_motor.set(0);
  }
}
