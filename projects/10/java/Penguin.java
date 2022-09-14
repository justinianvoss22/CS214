/* Penguin.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Penguin extends WalkingBird {

    public Penguin()
     {
        super();
     }
   /* explicit constructor
    * Receive: name, a String 
    * PostCond: myName == name.
    */
    public Penguin(String name)
    {     
      super(name);
    } 
  
  
   /* A Penguin's Call
    * Return: a Penguin-call ("WHEH! WHEH!").
    */
    public String call()
    {
      return "NOOT NOOT!";
    } 
  } 