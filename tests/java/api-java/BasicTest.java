
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.can.TalonFX;
import com.ctre.phoenix.motorcontrol.can.TalonSRX;
import com.ctre.phoenix.motorcontrol.can.VictorSPX;
import com.ctre.phoenix.sensors.CANCoder;
import com.ctre.phoenix.sensors.PigeonIMU;

class BasicTest {
  @Test
  void basicTest() {
    TalonSRX talon = new TalonSRX(0);
    talon.set(ControlMode.PercentOutput, 1);
    talon.DestroyObject();
  }
}
