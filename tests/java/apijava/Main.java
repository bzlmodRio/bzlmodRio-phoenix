package apijava;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.can.TalonSRX;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    TalonSRX talon = new TalonSRX(0);
    talon.set(ControlMode.PercentOutput, 1);
  }
}
