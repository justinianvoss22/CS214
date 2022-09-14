/* Kiwi.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Kiwi extends WalkingBird {

  public Kiwi()
   {
      super();
   }
 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Kiwi(String name)
  {     
    super(name);
  } 


 /* A Kiwi's Call
  * Return: a Kiwi-call ("Kiiii! Kiiii!!").
  */
  public String call()
  {
    return "Kiiii! Kiiii!!";
  } 
} 

