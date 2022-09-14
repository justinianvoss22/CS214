/* Bird.java provides a Bird class.
 *
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

import java.io.*;

public abstract class Bird
{

 /* default constructor
  * PostCond: myName == "".
  */
  public Bird()
  {
    myName = "";
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */

  public Bird(String name)
  {
    myName = name;
  } 


 /* Name accessor
  * Return: myName.
  */
  public String getName()
  {
    return myName;
  } 

 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
  public String call()
  {
    return "Squaaaaaaaaaawk!";
  } 

  public abstract String movement();

 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */

  public void print()
  {
    System.out.println( getName() + ' ' + getClass().getName() + " just " + movement()
                           + " and said, " + call() );
  } 


  private String myName;
}

