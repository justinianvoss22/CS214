/* Temperature.java implements class Temperature.
 * Student: Justin Voss
 * Date: 03/17/22
 ************************************************************/

 import java.util.Scanner;
 import java.lang.Character;


 // the Temperature class appears outside of the rest of the program
class Temperature {

    private static Scanner scanner = new Scanner(System.in);
    // private constants
    private static final char Fahrenheit = 'F';
    private static final char Celsius = 'C';
    private static final char Kelvin = 'K';
    // private instance variables
    private double myDegrees;
    private char myScale; 

    // initialization function
    public Temperature(double degrees, char scale) {
        myDegrees = degrees;
        myScale = Character.toUpperCase(scale);
        // uses the validity checker function to check if the inputs are valid
        if (!checkValid(myDegrees,myScale)){
            throw new IllegalArgumentException("Invalid input.");
        } 
    }

/*
*   getDegrees returns degrees, a double vale
*   Returns: myDegrees
*/
    public double getDegrees() {
        return myDegrees;
    }

/*
*   getScale returns the scale, either F, C, or K
*   Returns: myScale
*/
    public double getScale() {
        return myScale;
    }

/*
*   toFahrenheit returns the Temperature object, in Fahrenheit
*   Returns: a Temperature object, in Fahrenheit
*/
    public Temperature toFahrenheit() {
        if (myScale == Celsius){
            // F to C formula
            return new Temperature((myDegrees * (9/5.0)) + 32, Fahrenheit);
        }
        else if (myScale == Kelvin){
            // F to K formula
            return new Temperature((myDegrees - 273.15) * (9.0 /5.0) + 32, Fahrenheit);
        }
        else{
            return this;
        }
    }

/*
*   toCelsius returns the Temperature object, in Celsius
*   Returns: a Temperature object, in Celsius
*/
    public Temperature toCelsius() {
        if (myScale == Fahrenheit){
            // C to F formula
            return new Temperature((myDegrees - 32) * (5/9.0), Celsius);
        }   
        else if (myScale == Kelvin){
            // C to K formula
            return new Temperature(myDegrees - 273.15, Celsius);
        }
        else{
            return this;
        }
    }


 /*
*   toKelvin returns the Temperature object, in Kelvin
*   Returns: a Temperature object, in Kelvin
*/
    public Temperature toKelvin() {
        if (myScale == Fahrenheit){
            // F to K formula
            return new Temperature((myDegrees - 32.0) * (5/9.0) + 273.15, Kelvin);
        }
        else if (myScale == Celsius){
            // C to K formula
            return new Temperature(myDegrees + 273.15, Kelvin);
        }
        else{
            return this;
        }
    }

 /*
*   readTemperature returns the Temperature object from user input
*   Returns: a Temperature object, if it is valid
*/
    public static Temperature readTemperature() {
        
        String input = scanner.nextLine(); // reads user input
        String[] twoInputs = input.split(" "); // splits two parts into an array
        double degrees1 = Double.parseDouble(twoInputs[0]);  // puts degree1 as the index 0 of array
        char scale1 = twoInputs[1].charAt(0); // puts scale1 as the char at index 1
        
        try {      // checks if the double is valid
            degrees1 = Double.parseDouble(twoInputs[0]);
        } catch (NumberFormatException N) {
            return null;
        }
        
        if(!checkValid(degrees1,scale1)){ // checks if scale is valid
            return null;
        }
        // returns temperature object
        return new Temperature(degrees1, scale1);
    }

/*
*   printTemperature prints the Temperature object
*   Returns: prints the Temperature object
*/
    public void printTemperature() {
       // System.out.printf(String.format("%.2f ",myDegrees) + myScale);
        System.out.printf("%.2f\t%c", myDegrees, myScale);
        
    }

/*
*   raise returns a Temperature with a degree amount higher than the Temperature received
*   Returns: Temperature with a degree amount higher than the Temperature received
*/
public Temperature raise(double moreDegrees) {
    return new Temperature(myDegrees + moreDegrees, myScale);
}
/*
*   lower returns a Temperature with a degree amount lower than the Temperature received
*   Returns: Temperature with a degree amount lower than the Temperature received
*/
public Temperature lower(double moreDegrees) {
    return new Temperature(myDegrees - moreDegrees, myScale);
}



/*
*   Checks if two Temps are equal
    Parameters: another Temperature object temp
*   Returns: true if they are equal, false if the are not
*/
public boolean equals(Temperature temp) {
    // if myDegrees (on the left of the function) is equal to the temp (in the parameters), it returns true
    return compareTemps(temp).getDegrees() == myDegrees;
}


/*
*   Checks if one Temp is less than the other
    Parameters: another Temperature object temp
*   Returns: true if the left is less than, false if the are not
*/
public boolean lessThan(Temperature temp) {
    // if the degrees on the left are less than on the right, it returns true
    if(myDegrees < compareTemps(temp).getDegrees() ){
        return true;
    }
    return false;
}
/*
*   compareTemps looks at two Temp objects and returns one the other's scale
*   Parameters: a Temperature object temp
*   Returns: Temp object changed to the other Temp's scale
*/
public Temperature compareTemps(Temperature temp) {
    // if they are the same type, just return the temp
    if (temp.myScale != myScale) {
        // otherwise, convert them to the same type
	    if (myScale == Celsius){
		    return temp.toCelsius();
        }
	    else if (myScale == Kelvin){
		    return temp.toKelvin();
        }
	    else{
		    return temp.toFahrenheit();
        }
	}
    return temp;
}
    


/*
*   checkValid checks if the input is valid
*   Parameters: a double, degrees, and a character, scale
*   Returns: true or false, based on if it is valid or not
*/
    private static boolean checkValid(double degrees, char scale){
        char scaleCheck = Character.toUpperCase(scale);
        if ((scaleCheck == Fahrenheit && degrees >= -459.67) || (scaleCheck == Celsius && degrees >= -273.15) || (scaleCheck == Kelvin && degrees >= 0.0 )) {
            return true;
        }
        return false;
    }
}