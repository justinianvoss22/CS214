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

