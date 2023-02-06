package wpiapijava;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    WPI_TalonSRX talon = new WPI_TalonSRX(0);
    talon.set(ControlMode.PercentOutput, 1);
  }
}
