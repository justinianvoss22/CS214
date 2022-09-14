-- temperature.ads declares the temperature type and its operations.
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

    
end Temperature_Package;