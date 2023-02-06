package apijava;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.can.TalonSRX;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    TalonSRX talon = new TalonSRX(0);
    talon.set(ControlMode.PercentOutput, 1);
    talon.DestroyObject();
  }
}
