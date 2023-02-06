package wpiapijava;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    WPI_TalonSRX talon = new WPI_TalonSRX(0);
    talon.set(ControlMode.PercentOutput, 1);
  }
}
