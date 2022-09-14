Script started on 2022-03-19 20:02:31-04:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="105" LINES="30"]
]0;jav86@gold29: ~/CS214/projects/09/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/java[00m$ cat TemperatureTester.java Temperature.java
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
}/* Temperature.java implements class Temperature.
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
}]0;jav86@gold29: ~/CS214/projects/09/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/java[00m$ javac -deprea cation TemperatureTese ter.java
]0;jav86@gold29: ~/CS214/projects/09/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/java[00m$ java TemperatureTester
32.00	F
0.00	C
273.15	K
All tests passed!

Enter a base temperature and scale: 
0 F

Enter a stop temperature and scale: 
100 C

Enter a step value: 
2.5
0.00	F	-17.78	C	255.37	K
2.50	F	-16.39	C	256.76	K
5.00	F	-15.00	C	258.15	K
7.50	F	-13.61	C	259.54	K
10.00	F	-12.22	C	260.93	K
12.50	F	-10.83	C	262.32	K
15.00	F	-9.44	C	263.71	K
17.50	F	-8.06	C	265.09	K
20.00	F	-6.67	C	266.48	K
22.50	F	-5.28	C	267.87	K
25.00	F	-3.89	C	269.26	K
27.50	F	-2.50	C	270.65	K
30.00	F	-1.11	C	272.04	K
32.50	F	0.28	C	273.43	K
35.00	F	1.67	C	274.82	K
37.50	F	3.06	C	276.21	K
40.00	F	4.44	C	277.59	K
42.50	F	5.83	C	278.98	K
45.00	F	7.22	C	280.37	K
47.50	F	8.61	C	281.76	K
50.00	F	10.00	C	283.15	K
52.50	F	11.39	C	284.54	K
55.00	F	12.78	C	285.93	K
57.50	F	14.17	C	287.32	K
60.00	F	15.56	C	288.71	K
62.50	F	16.94	C	290.09	K
65.00	F	18.33	C	291.48	K
67.50	F	19.72	C	292.87	K
70.00	F	21.11	C	294.26	K
72.50	F	22.50	C	295.65	K
75.00	F	23.89	C	297.04	K
77.50	F	25.28	C	298.43	K
80.00	F	26.67	C	299.82	K
82.50	F	28.06	C	301.21	K
85.00	F	29.44	C	302.59	K
87.50	F	30.83	C	303.98	K
90.00	F	32.22	C	305.37	K
92.50	F	33.61	C	306.76	K
95.00	F	35.00	C	308.15	K
97.50	F	36.39	C	309.54	K
100.00	F	37.78	C	310.93	K
102.50	F	39.17	C	312.32	K
105.00	F	40.56	C	313.71	K
107.50	F	41.94	C	315.09	K
110.00	F	43.33	C	316.48	K
112.50	F	44.72	C	317.87	K
115.00	F	46.11	C	319.26	K
117.50	F	47.50	C	320.65	K
120.00	F	48.89	C	322.04	K
122.50	F	50.28	C	323.43	K
125.00	F	51.67	C	324.82	K
127.50	F	53.06	C	326.21	K
130.00	F	54.44	C	327.59	K
132.50	F	55.83	C	328.98	K
135.00	F	57.22	C	330.37	K
137.50	F	58.61	C	331.76	K
140.00	F	60.00	C	333.15	K
142.50	F	61.39	C	334.54	K
145.00	F	62.78	C	335.93	K
147.50	F	64.17	C	337.32	K
150.00	F	65.56	C	338.71	K
152.50	F	66.94	C	340.09	K
155.00	F	68.33	C	341.48	K
157.50	F	69.72	C	342.87	K
160.00	F	71.11	C	344.26	K
162.50	F	72.50	C	345.65	K
165.00	F	73.89	C	347.04	K
167.50	F	75.28	C	348.43	K
170.00	F	76.67	C	349.82	K
172.50	F	78.06	C	351.21	K
175.00	F	79.44	C	352.59	K
177.50	F	80.83	C	353.98	K
180.00	F	82.22	C	355.37	K
182.50	F	83.61	C	356.76	K
185.00	F	85.00	C	358.15	K
187.50	F	86.39	C	359.54	K
190.00	F	87.78	C	360.93	K
192.50	F	89.17	C	362.32	K
195.00	F	90.56	C	363.71	K
197.50	F	91.94	C	365.09	K
200.00	F	93.33	C	366.48	K
202.50	F	94.72	C	367.87	K
205.00	F	96.11	C	369.26	K
207.50	F	97.50	C	370.65	K
210.00	F	98.89	C	372.04	K
]0;jav86@gold29: ~/CS214/projects/09/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/java[00m$ java TemperatureTester
32.00	F
0.00	C
273.15	K
All tests passed!

Enter a base temperature and scale: 
0 K

Enter a stop temperature and scale: 
212 F

Enter a step value: 
20.0
-459.67	F	-273.15	C	0.00	K
-423.67	F	-253.15	C	20.00	K
-387.67	F	-233.15	C	40.00	K
-351.67	F	-213.15	C	60.00	K
-315.67	F	-193.15	C	80.00	K
-279.67	F	-173.15	C	100.00	K
-243.67	F	-153.15	C	120.00	K
-207.67	F	-133.15	C	140.00	K
-171.67	F	-113.15	C	160.00	K
-135.67	F	-93.15	C	180.00	K
-99.67	F	-73.15	C	200.00	K
-63.67	F	-53.15	C	220.00	K
-27.67	F	-33.15	C	240.00	K
8.33	F	-13.15	C	260.00	K
44.33	F	6.85	C	280.00	K
80.33	F	26.85	C	300.00	K
116.33	F	46.85	C	320.00	K
152.33	F	66.85	C	340.00	K
188.33	F	86.85	C	360.00	K
]0;jav86@gold29: ~/CS214/projects/09/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/java[00m$ exit

Script done on 2022-03-19 20:03:18-04:00 [COMMAND_EXIT_CODE="0"]
