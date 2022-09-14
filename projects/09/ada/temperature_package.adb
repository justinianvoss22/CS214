-- temperature_package.adb defines operations for the Temperature type.
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

end Temperature_Package;