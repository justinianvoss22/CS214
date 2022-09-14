/* Ostrich.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Ostrich extends WalkingBird {

    public Ostrich()
     {
        super();
     }
   /* explicit constructor
    * Receive: name, a String 
    * PostCond: myName == name.
    */
    public Ostrich(String name)
    {     
      super(name);
    } 
  
  
   /* A Ostrich's Call
    * Return: a Ostrich-call ("WHAAAA!!").
    */
    public String call()
    {
      return "WHAAAA!!";
    } 
  } 