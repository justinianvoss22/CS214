/* TemperatureTester.java is a 'driver' to test class Temperature.
 * Student: Justin Voss
 * Date: 03/17/22
 ************************************************************/
import java.util.Scanner;

public class TemperatureTester  
{
  public static void main(String[] args)
  {
      Temperature temp1 = new Temperature(32, 'F');
      Temperature temp2 = new Temperature(0, 'C');
      Temperature temp3 = new Temperature(273.15, 'K');

    // testing getter methods
      // getDegrees
      assert temp1.getDegrees() == 32;
      assert temp2.getDegrees()== 0;
      assert temp3.getDegrees()== 273.15;
      // getScale
      assert temp1.getScale() == 'F';
      assert temp2.getScale() == 'C';
      assert temp3.getScale() == 'K';

    // testing converter methods
      // toFahrenheight()
      assert temp1.toFahrenheit() == temp1;
      assert temp2.toFahrenheit() == temp1;
      assert temp3.toFahrenheit() == temp1;
      // toCelsius()
      assert temp1.toCelsius() == temp2;
      assert temp2.toCelsius() == temp2;
      assert temp3.toCelsius() == temp2;
      // toKelvin()
      assert temp1.toKelvin() == temp3;
      assert temp2.toKelvin() == temp3;
      assert temp3.toKelvin() == temp3;

      // testing print temperature
      temp1.printTemperature();
      System.out.println();
      temp2.printTemperature();
      System.out.println();
      temp3.printTemperature();
      System.out.println();

      if (!temp2.equals(temp3)){
        System.out.println("ERROR, temp2 and temp3 should equal");
      }
      

      // System.out.println("\nTesting toCelsius...");
      // Temperature tempA = new Temperature(100, 'F');
      // System.out.println(tempA.getDegrees());

      // tempA.toCelsius().printTemperature();
      // System.out.println(tempA.toCelsius().getDegrees());

      System.out.println("All tests passed!");


      Scanner scanner = new Scanner(System.in);

      System.out.println("\nEnter a base temperature and scale: ");
      
      Temperature baseTemp = Temperature.readTemperature();
      // From the read function, if it is null, then it is an invalid function
      if (baseTemp == null){
        System.out.println("Invalid input. Try again. ");
      }
      System.out.println("\nEnter a stop temperature and scale: ");
      Temperature limitTemp = Temperature.readTemperature();
      if (limitTemp == null){
        System.out.println("Invalid input. Try again. ");
      }
      System.out.println("\nEnter a step value: ");
      double stepValue = scanner.nextDouble();
      scanner.close();

      // keep track off temperature with current
      Temperature current = baseTemp;

      // loops until table is finished
      while (true){
        // if the current and base temp are less than the limit OR it equals limit temp (would only print one value).
        if (current.lessThan(limitTemp) == baseTemp.lessThan(limitTemp) || current.equals(limitTemp)){
        
          // If the base is bigger than the limit, it gives an error and does not produce output.
          if (!baseTemp.lessThan(limitTemp)){
            System.out.println("Error: base temp has to be greater than limit temp.");
            break;
        }
          else {

        // prints out the temperatures
        current.toFahrenheit().printTemperature();
        System.out.print("\t");
        current.toCelsius().printTemperature();
        System.out.print("\t");
        current.toKelvin().printTemperature();
        System.out.println();

        current = current.raise(stepValue);
        }
      }
      else { break;}
    }


    }  
}