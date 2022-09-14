-- temperature_tester.adb "test-drives" the Temperature type.
--
-- Completed by: Justin Voss
-- Date: 3/17/22
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Temperature_Package; use Temperature_Package;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure temperature_tester is


  aTemp : Temperature_Package.Temperature;
  aTemp2 : Temperature_Package.Temperature;
  aTemp3 : Temperature_Package.Temperature;
  aTemp4 : Temperature_Package.Temperature;
  aTemp5 : Temperature_Package.Temperature;
  
  baseTemp : Temperature_Package.Temperature;
  limitTemp :  Temperature_Package.Temperature;
  stepValue : Float;
  currentTemp : Temperature_Package.Temperature;
  temporaryTemp : Temperature_Package.Temperature;
  

begin
  Init(aTemp, 32.0, 'f');
  Init(aTemp2, 0.0, 'c');
  Init(aTemp3, 273.15, 'K');
  Init(aTemp4, 32.0, 'f');
  Init(aTemp5, 100.0, 'F');
  -- testing get method
  pragma Assert(getDegrees(atemp) = 32.0);
  -- testing converter methods
  pragma Assert(toFahrenheit(aTemp4) = aTemp);
  pragma Assert(toCelsius(aTemp2) = aTemp);
  pragma Assert(toKelvin(aTemp3) = aTemp);
  -- test equals
  pragma Assert(equals(aTemp, aTemp4) = True);
  pragma Assert(equals(aTemp, aTemp2) = False);
  -- test less than
  pragma Assert(lessThan(aTemp, aTemp4) = False);
  pragma Assert(lessThan(aTemp, aTemp5) = True);

  printTemperature(toCelsius(aTemp5));
  Put("All tests passed!"); New_line;

  
  Put_Line("");

  Put_Line("To enter a start temperature... ");
  readTemperature(baseTemp);
  Put_Line("To enter a stop temperature... ");
  readTemperature(limitTemp);
  Put_Line("Enter a step value: ");
  Get(stepValue);
  currentTemp := baseTemp;

if Temperature_Package.lessThan(baseTemp, limitTemp) = False then
      Put("Error: base temp has to be greater than limit temp.");
      return;
      else 
          while lessThan(currentTemp, limitTemp) loop
  
        temporaryTemp := toFahrenheit(currentTemp);
        printTemperature(temporaryTemp);
        temporaryTemp := toCelsius(currentTemp);
        printTemperature(temporaryTemp);
        temporaryTemp := toKelvin(currentTemp);
        printTemperature(temporaryTemp);
        New_Line;
        currentTemp := raiseTemperature(currentTemp, stepValue);
  end loop;
end if;


end temperature_tester;