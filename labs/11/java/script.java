Script started on 2022-03-28 18:12:18-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold29: ~/CS214/labs/11/java[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/11/java[00m$ cat Max.java
/* Max.java finds the maximum values in Java linked lists.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: Justin Voss
 * Date: 3/31/22
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Max {

  public static void main(String [] args) {
    // define list1, list2, list3 here ...
    LinkedList<Integer> list1 = new LinkedList<Integer>();
    LinkedList<Integer> list2 = new LinkedList<Integer>();
    LinkedList<Integer> list3 = new LinkedList<Integer>();
    list1.add(99);    // 99, 88, 77, 66, 55
    list1.add(88);    // max is first
    list1.add(77);
    list1.add(66);  
    list1.add(55);

    list2.add(55);    // 55, 66, 77, 88, 99
    list2.add(66);    // max is last
    list2.add(77);  
    list2.add(88);  
    list2.add(99);  
  
    list3.add(55);    // 55, 77, 99, 88, 66
    list3.add(77);    // max is in the middle
    list3.add(99);  
    list3.add(88);  
    list3.add(66);  
  
   print(list1); 
   print(list2); 
   print(list3);

   System.out.println("Max of list1: " + Collections.max(list1));
   System.out.println("Max of list2: " + Collections.max(list2));
   System.out.println("Max of list3: " + Collections.max(list3));
  }

  /** print() displays a LinkedList on the console.
   *
   * @param: aList, a LinkedList<Integer>
   * 
   * Postcondition: the Integer values in aList
   *                 have been displayed to System.out,
   *                 separated by spaces.
   */
  public static void print(LinkedList<Integer> aList){
    Iterator<Integer> listIterator = aList.iterator();
    while (listIterator.hasNext()){
        System.out.print(listIterator.next() + " ");
    }
    System.out.print('\n');
      }

}

]0;jav86@gold29: ~/CS214/labs/11/java[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/11/java[00m$ javac -p deprecation Max.java
]0;jav86@gold29: ~/CS214/labs/11/java[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/11/java[00m$ java Max
99 88 77 66 55 
55 66 77 88 99 
55 77 99 88 66 
Max of list1: 99
Max of list2: 99
Max of list3: 99
]0;jav86@gold29: ~/CS214/labs/11/java[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/11/java[00m$ exit

Script done on 2022-03-28 18:12:51-04:00 [COMMAND_EXIT_CODE="0"]
