Script started on 2022-03-19 20:00:33-04:00 [TERM="xterm-256color" TTY="/dev/pts/3" COLUMNS="105" LINES="30"]
]0;jav86@gold29: ~/CS214/projects/09/ada[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ada[00m$ cat temperature_tester.adb temperature  _package.ads temperature_pack age.adb
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


end temperature_tester;-- temperature.ads declares the temperature type and its operations.
-- Completed by: Justin Voss
-- Date: 3/17/22
--------------------------------------------------------------

package temperature_package is

type temperature is private;

procedure Init(Temp: out Temperature; degrees: in Float; scale : in Character);

    function getDegrees( Temp: in Temperature) return Float;

    function getScale( Temp: in Temperature) return Character;

    function toFahrenheit( Temp: in out Temperature) return Temperature;

    function checkValid( degrees : Float; scale : Character) return Boolean;

    function toCelsius( Temp: in out Temperature) return Temperature;

    function toKelvin( Temp: in out Temperature) return Temperature;

    procedure readTemperature( Temp: in out Temperature);

    procedure printTemperature( Temp: in Temperature);

    function raiseTemperature( Temp: in Temperature; moreDegrees : Float) return Temperature;

    function lowerTemperature( Temp: in Temperature; moreDegrees : Float) return Temperature;

     function equals( Temp: in out Temperature; Temp2 : in out Temperature) return boolean;

    function lessThan( Temp: in Temperature; Temp2 : in Temperature) return boolean;
    


private 

    type Temperature is
        record
          myDegrees: Float;
          myScale : Character;
        end record;

    
end Temperature_Package;-- temperature_package.adb defines operations for the Temperature type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 3/17/22
---------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Temperature_Package is

  ----------------------------------------------
  -- Init initializes a aTemp variable          
  -- Receive: Temp, the Temp variable;          
  --          degrees, a float   
  --          scale, a char, (one of 'F', 'C', 'K' 'f', 'c', or 'k')     
  -- Return: Temp, its fields set to myDegrees and myScale
  --                    
  ----------------------------------------------

  procedure Init(Temp: out Temperature; degrees: in Float; scale : in Character) is
  begin
    Temp.myDegrees := degrees;
    Temp.myScale := To_Upper(scale); 
    if (checkValid(Temp.myDegrees, Temp.myScale) = False) then  -- checks if valid
        Put("Error: Invalid argument.");
        return;
    end if;
  end Init;

------------------------------------------------
--  getDegrees returns myDegrees, a float 
-- Receive: Temp, the Temp variable;          
--   Returns: myDegrees 
------------------------------------------------
    function getDegrees( Temp: in Temperature) return Float is
    begin
        return Temp.myDegrees;
    end getDegrees;

------------------------------------------------
--  getScale returns the scale, either F, C, or K
-- Receive: Temp, the Temp variable;          
--  Returns: myScale
------------------------------------------------
    function getScale( Temp: in Temperature) return Character is
    begin
        return Temp.myScale;
    end getScale;

----------------------------------------------
-- toFahrenheit returns the Temperature object, in Fahrenheit
-- Receive: Temp, the Temp variable;                              
-- Returns: a Temperature object, in Fahrenheit
----------------------------------------------
    function toFahrenheit( Temp: in out Temperature) return Temperature is
    Temp2 : Temperature;
    begin
        if Temp.myScale = 'C' then
            Init(Temp2, (Temp.myDegrees * (9.0 / 5.0) + 32.0), 'F');
        elsif Temp.myScale = 'K' then
            Init(Temp2, (Temp.myDegrees - 273.15) * (9.0 / 5.0) + 32.0, 'F');
        else 
            return Temp;
        end if;
        return Temp2;
    end toFahrenheit;

----------------------------------------------
-- toCelsius returns the Temperature object, in Celsius
-- Receive: Temp, the Temp variable;                              
-- Returns: a Temperature object, in Celsius
----------------------------------------------
    function toCelsius( Temp: in out Temperature) return Temperature is
    Temp2 : Temperature;
    begin
        if Temp.myScale = 'F' then
            Init(Temp2, (Temp.myDegrees - 32.0) * (5.0/9.0), 'C');
        elsif Temp.myScale = 'K' then
            Init(Temp2, (Temp.myDegrees - 273.15), 'C');
        else 
            return Temp;
        end if;
        return Temp2;
    end toCelsius;

----------------------------------------------
-- toKelvin returns the Temperature object, in Kelvin
-- Receive: Temp, the Temp variable;                              
-- Returns: a Temperature object, in Kelvin
----------------------------------------------
    function toKelvin( Temp: in out Temperature) return Temperature is
    Temp2 : Temperature;
    begin
        if Temp.myScale = 'F' then
            Init(Temp2, (Temp.myDegrees - 32.0) * (5.0/9.0) + 273.15, 'K');
        elsif Temp.myScale = 'C' then
            Init(Temp2, (Temp.myDegrees + 273.15), 'K');
        else 
            return Temp;
        end if;
        return Temp2;
    end toKelvin;

----------------------------------------------
-- readTemperature returns the Temperature object from user input
-- Receive: Temp, the Temp variable;                              
-- Returns: a Temperature object from user input, if it is valid
----------------------------------------------
    procedure readTemperature( Temp: in out Temperature) is
        degree : Float;
        scale : Character;

    begin
        Put(" Enter a degree: ");
        Get(degree);
        Put(" Enter a scale: ");
        Get(scale);
    if (checkValid(degree,scale) = True ) then
        Init(Temp, degree, scale);
    else
        Put("Invalid argument."); 
        return;
       
    end if;
    end readTemperature;

----------------------------------------------
-- printTemperature prints the Temperature object
-- Receive: Temp, the Temp variable;                              
-- Returns: prints a Temperature object from user input, if it is valid
----------------------------------------------
    procedure printTemperature( Temp: in Temperature) is
    begin
        Put(getDegrees(Temp), 0, 2, 0);
        Put("      ");
        Put(getScale(Temp));
        Put("      ");

    end printTemperature;

----------------------------------------------
-- raiseTemperature raises the degree of the Temp object
-- Receive: Temp, the Temp variablel, and the degrees to raise it by;                              
-- Returns: raises the temp by a certain amount of degrees
----------------------------------------------
    function raiseTemperature( Temp: in Temperature; moreDegrees : Float) return Temperature is
        temp2 : Temperature;
    begin
        Init(temp2, Temp.myDegrees + moreDegrees, Temp.myScale);
        return temp2;
    end raiseTemperature;

---------------------------------------------
-- lowerTemperature lowers the degree of the Temp object
-- Receive: Temp, the Temp variablel, and the degrees to raise it by;                              
-- Returns: lowers the temp by a certain amount of degrees
----------------------------------------------
    function lowerTemperature( Temp: in Temperature; moreDegrees : Float) return Temperature is
        temp2 : Temperature;
    begin
        Init(temp2, Temp.myDegrees - moreDegrees, Temp.myScale);
        return temp2;
    end lowerTemperature;


---------------------------------------------
-- equals compares two temps and checks if they are equal
-- Receive: an in Temperature Temp, another in Temperature Temp2                             
-- Returns: true if they are equal, false if the are not
----------------------------------------------
    function equals( Temp: in out Temperature; Temp2 : in out Temperature) return boolean is
    Temp3 : Temperature;  -- two temp objects to be used for comparison
    Temp4 : Temperature;
    begin
        Temp3 :=  Temp;
        Temp4 := Temp2;
        if Temp3.myScale = Temp4.myScale then
            return Temp3.myDegrees = Temp4.myDegrees;
        else 
            Temp3 := toCelsius(Temp3);  -- turns them all to the same temperature scale
            Temp4 := toCelsius(Temp4);
            return Temp3.myDegrees = Temp4.myDegrees;
        end if;
    end equals;

---------------------------------------------
-- lessThan compares two temps and checks if the left is less than right
-- Receive: an in Temperature Temp, another in Temperature Temp2                             
-- Returns: true if the left is less than, false if it is not
----------------------------------------------
    function lessThan( Temp: in Temperature; Temp2 : in Temperature) return boolean is
    Temp3 : Temperature;
    Temp4 : Temperature;
    begin
        Temp3 :=  Temp;
        Temp4 := Temp2;
        if Temp3.myScale = Temp4.myScale then
            return Temp3.myDegrees < Temp4.myDegrees;
        else 
            Temp3 := toCelsius(Temp3);  -- turns them all to the same temperature scale
            Temp4 := toCelsius(Temp4);
            return Temp3.myDegrees < Temp4.myDegrees;
        end if;
    end lessThan;


----------------------------------------------
-- checkValid checks if the input is valid
-- Parameters: a double, degrees, and a character, scale     
-- Returns: true or false, based on if it is valid or not
----------------------------------------------
    function checkValid( degrees : Float; scale : Character) return Boolean is
    scaleCheck : Character := To_Upper(scale);
    begin
        if scaleCheck = 'F' and degrees >= -459.67 then
            return True;
        elsif scaleCheck = 'C' and degrees >= -273.15 then
            return True;
        elsif scaleCheck = 'K' and degrees >= 0.0 then
            return True;
        else
            return False;
        end if;
    
    end checkValid;

end Temperature_Package;]0;jav86@gold29: ~/CS214/projects/09/ada[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ada[00m$ [Kgnatmake temperature_tester.adb
gnatmake: "temperature_tester" up to date.
]0;jav86@gold29: ~/CS214/projects/09/ada[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ada[00m$ t ./temperature_tester
37.78      C      All tests passed!

To enter a start temperature... 
 Enter a degree: 0
 Enter a scale: F
To enter a stop temperature... 
 Enter a degree: 100
 Enter a scale: C
Enter a step value: 
2.5
0.00      F      -17.78      C      255.37      K      
2.50      F      -16.39      C      256.76      K      
5.00      F      -15.00      C      258.15      K      
7.50      F      -13.61      C      259.54      K      
10.00      F      -12.22      C      260.93      K      
12.50      F      -10.83      C      262.32      K      
15.00      F      -9.44      C      263.71      K      
17.50      F      -8.06      C      265.09      K      
20.00      F      -6.67      C      266.48      K      
22.50      F      -5.28      C      267.87      K      
25.00      F      -3.89      C      269.26      K      
27.50      F      -2.50      C      270.65      K      
30.00      F      -1.11      C      272.04      K      
32.50      F      0.28      C      273.43      K      
35.00      F      1.67      C      274.82      K      
37.50      F      3.06      C      276.21      K      
40.00      F      4.44      C      277.59      K      
42.50      F      5.83      C      278.98      K      
45.00      F      7.22      C      280.37      K      
47.50      F      8.61      C      281.76      K      
50.00      F      10.00      C      283.15      K      
52.50      F      11.39      C      284.54      K      
55.00      F      12.78      C      285.93      K      
57.50      F      14.17      C      287.32      K      
60.00      F      15.56      C      288.71      K      
62.50      F      16.94      C      290.09      K      
65.00      F      18.33      C      291.48      K      
67.50      F      19.72      C      292.87      K      
70.00      F      21.11      C      294.26      K      
72.50      F      22.50      C      295.65      K      
75.00      F      23.89      C      297.04      K      
77.50      F      25.28      C      298.43      K      
80.00      F      26.67      C      299.82      K      
82.50      F      28.06      C      301.21      K      
85.00      F      29.44      C      302.59      K      
87.50      F      30.83      C      303.98      K      
90.00      F      32.22      C      305.37      K      
92.50      F      33.61      C      306.76      K      
95.00      F      35.00      C      308.15      K      
97.50      F      36.39      C      309.54      K      
100.00      F      37.78      C      310.93      K      
102.50      F      39.17      C      312.32      K      
105.00      F      40.56      C      313.71      K      
107.50      F      41.94      C      315.09      K      
110.00      F      43.33      C      316.48      K      
112.50      F      44.72      C      317.87      K      
115.00      F      46.11      C      319.26      K      
117.50      F      47.50      C      320.65      K      
120.00      F      48.89      C      322.04      K      
122.50      F      50.28      C      323.43      K      
125.00      F      51.67      C      324.82      K      
127.50      F      53.06      C      326.21      K      
130.00      F      54.44      C      327.59      K      
132.50      F      55.83      C      328.98      K      
135.00      F      57.22      C      330.37      K      
137.50      F      58.61      C      331.76      K      
140.00      F      60.00      C      333.15      K      
142.50      F      61.39      C      334.54      K      
145.00      F      62.78      C      335.93      K      
147.50      F      64.17      C      337.32      K      
150.00      F      65.56      C      338.71      K      
152.50      F      66.94      C      340.09      K      
155.00      F      68.33      C      341.48      K      
157.50      F      69.72      C      342.87      K      
160.00      F      71.11      C      344.26      K      
162.50      F      72.50      C      345.65      K      
165.00      F      73.89      C      347.04      K      
167.50      F      75.28      C      348.43      K      
170.00      F      76.67      C      349.82      K      
172.50      F      78.06      C      351.21      K      
175.00      F      79.44      C      352.59      K      
177.50      F      80.83      C      353.98      K      
180.00      F      82.22      C      355.37      K      
182.50      F      83.61      C      356.76      K      
185.00      F      85.00      C      358.15      K      
187.50      F      86.39      C      359.54      K      
190.00      F      87.78      C      360.93      K      
192.50      F      89.17      C      362.32      K      
195.00      F      90.56      C      363.71      K      
197.50      F      91.94      C      365.09      K      
200.00      F      93.33      C      366.48      K      
202.50      F      94.72      C      367.87      K      
205.00      F      96.11      C      369.26      K      
207.50      F      97.50      C      370.65      K      
210.00      F      98.89      C      372.04      K      
]0;jav86@gold29: ~/CS214/projects/09/ada[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ada[00m$ ./temperature_tester
37.78      C      All tests passed!

To enter a start temperature... 
 Enter a degree: 0
 Enter a scale: K
To enter a stop temperature... 
 Enter a degree: 212
 Enter a scale: F
Enter a step value: 
20.0
-459.67      F      -273.15      C      0.00      K      
-423.67      F      -253.15      C      20.00      K      
-387.67      F      -233.15      C      40.00      K      
-351.67      F      -213.15      C      60.00      K      
-315.67      F      -193.15      C      80.00      K      
-279.67      F      -173.15      C      100.00      K      
-243.67      F      -153.15      C      120.00      K      
-207.67      F      -133.15      C      140.00      K      
-171.67      F      -113.15      C      160.00      K      
-135.67      F      -93.15      C      180.00      K      
-99.67      F      -73.15      C      200.00      K      
-63.67      F      -53.15      C      220.00      K      
-27.67      F      -33.15      C      240.00      K      
8.33      F      -13.15      C      260.00      K      
44.33      F      6.85      C      280.00      K      
80.33      F      26.85      C      300.00      K      
116.33      F      46.85      C      320.00      K      
152.33      F      66.85      C      340.00      K      
188.33      F      86.85      C      360.00      K      
]0;jav86@gold29: ~/CS214/projects/09/ada[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ada[00m$ exit

Script done on 2022-03-19 20:02:12-04:00 [COMMAND_EXIT_CODE="0"]
