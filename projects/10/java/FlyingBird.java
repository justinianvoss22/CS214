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
}