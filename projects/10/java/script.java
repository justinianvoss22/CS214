Script started on 2022-03-24 15:43:08-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="119" LINES="24"]
]0;jav86@gold29: ~/CS214/projects/10/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/java[00m$ B cat c i Birds.java Bird.java WalkingBird.java Penguin.java Ostrich.java Kiwil.  .java Fl yingi Bird.java Duck.java Goose.java Owl.java
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {

      System.out.println("\nWelcome to the Bird Park!\n");

      Duck bird2 = new Duck("Donald");
      bird2.print();

      Goose bird3 = new Goose("Mother Goose");
      bird3.print();

      Owl bird4 = new Owl("Woodsey");
      bird4.print();

      Ostrich bird5 = new Ostrich("Oliver");
      bird5.print();

      Penguin bird6 = new Penguin("Pingu");
      bird6.print();

      Kiwi bird7 = new Kiwi("Ninja");
      bird7.print();

      System.out.println();
    }
}

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

/* WalkingBird.java provides a Bird class.
 *
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/


public class WalkingBird extends Bird {
    public WalkingBird() {
        super();
     }

     public WalkingBird(String name)
     {     
        super(name);
     } 

     public String movement(){
         return "walked";
     }
}/* Penguin.java provides a Duck subclass of Bird.
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
  } /* Ostrich.java provides a Duck subclass of Bird.
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
  } /* Kiwi.java provides a Duck subclass of Bird.
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

/* FlyingBird.java provides a Bird class.
 *
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class FlyingBird extends Bird {
    public FlyingBird() {
        super();
     }

     public FlyingBird(String name)
     {     
        super(name);
     } 

     public String movement(){
         return "flew";
     }
}/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Duck extends FlyingBird {
    


  public Duck() {
    super();
 }
 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
 
 public Duck(String name)
 {     
    super(name);
 } 

 /* A Duck's Call
  * Return: a duck-call ("Quack!").
  */
  public String call()
  {
    return "Quack!";
  } 

}

/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Goose extends FlyingBird {

  public Goose()
   {
      super();
   }
 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Goose(String name)
  {     
    super(name);
  } 


 /* A Goose's Call
  * Return: a goose-call ("Honk!").
  */
  public String call()
  {
    return "Honk!";
  } 
} 

/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 03/24/2022
 ******************************************************/

public class Owl extends FlyingBird {
  public Owl(){
    super();
  }
 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Owl(String name){
    super(name);
  }


 /* An Owl's Call
  * Return: an owl-call ("Whoo-hoo!").
  */
  public String call()
  {
    return "Hoo! Hoo!";
  }
} 

]0;jav86@gold29: ~/CS214/projects/10/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/java[00m$ [Kmake Birds
javac -deprecation Birds.java
]0;jav86@gold29: ~/CS214/projects/10/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/java[00m$ make    jha  ava Birds

Welcome to the Bird Park!

Donald Duck just flew and said, Quack!
Mother Goose Goose just flew and said, Honk!
Woodsey Owl just flew and said, Hoo! Hoo!
Oliver Ostrich just walked and said, WHAAAA!!
Pingu Penguin just walked and said, NOOT NOOT!
Ninja Kiwi just walked and said, Kiiii! Kiiii!!

]0;jav86@gold29: ~/CS214/projects/10/java[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/java[00m$ exit

Script done on 2022-03-24 15:43:49-04:00 [COMMAND_EXIT_CODE="0"]
