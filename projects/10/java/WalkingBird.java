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
}