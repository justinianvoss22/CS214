Script started on 2022-03-16 14:10:25-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="74" LINES="24"]
]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ cat name_tester.ada
cat: name_tester.ada: No such file or directory
]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ cat name_tester.adb name_package.ads N ame_package.adb
-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Justin Voss
-- Date: 3/17/22
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Name_Package; use Name_Package;

procedure name_tester is


  aName : Name_Package.Name ;

begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ",
                   "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", 
                   "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", 
                   "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ",
                    "getFullName() failed");
   Put(aName); New_line;
   Put("All tests passed!"); New_line;
end name_tester;

-- name_package.ads declares the Name type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 3/17/22
--------------------------------------------------------------

package Name_Package is

type Name is private;
----------------------------------------------
  -- Init initializes a Name variable          
  -- Receive: Nm, the Name variable;          
  --          First, the first name;         
  --          Middle, the middle name;      
  --          Last, the last name.         
  -- Return: Nm, its fields set to First, 
  --               Middle, and Last.     
  ----------------------------------------------

  procedure Init(Nm: out Name;
                 First, Middle, Last : in String);
----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: Nm, a Name.                 -
  -- PRE: Nm has been initialized.        -
  -- Return: Nm.myFirst.                  -
  ----------------------------------------------

  function getFirst(Nm : in Name) return String;

  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.myFirst        -
  -- Receive: Nm, a Name.                 -
  -- PRE: Nm has been initialized.        -
  -- Return: Nm.myMiddle.                  -
  ----------------------------------------------

  function getMiddle(Nm : in Name) return String;

  ----------------------------------------------
  -- getLast(Name) retrieves Name.myFirst        -
  -- Receive: Nm, a Name.                 -
  -- PRE: Nm has been initialized.        -
  -- Return: Nm.myLast.                  -
  ----------------------------------------------

  function getLast(Nm : in Name) return String;

   ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: Nm has been initialized.        -
  -- Receive: Nm, a Name.                 -
  -- Output: Nm, to the screen.           -
  ----------------------------------------------

  procedure Put(Nm : in Name);
  
-----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: Nm, a Name.                  -
  -- PRE: Nm has been initialized.         -
  -- Return: a String representation of Nm -
  -----------------------------------------------

  function getFullName(Nm : in Name) return String;

 
private 

    NAME_SIZE : constant Positive := 8;

    type Name is
        record
            myFirst,
            myMiddle,
            MyLast : String(1..NAME_SIZE);
        end record;

    
end Name_Package;cat: Name_package.adb: No such file or directory
]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ [Kname    cat name_package.adb
-- name_package.adb defines operations for the Name type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 3/17/22
---------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

package body Name_Package is

  ----------------------------------------------
  -- Init initializes a Name variable          
  -- Receive: Nm, the Name variable;          
  --          First, the first name;         
  --          Middle, the middle name;      
  --          Last, the last name.         
  -- Return: Nm, its fields set to First, 
  --               Middle, and Last.     
  ----------------------------------------------

  procedure Init(Nm: out Name;
                 First, Middle, Last : in String) is
  begin
    Nm.MyFirst := First;
    Nm.MyMiddle := Middle;
    Nm.MyLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        
  -- Receive: Nm, a Name.                      
  -- PRE: Nm has been initialized.            
  -- Return: Nm.myFirst.                     
  ----------------------------------------------
  function getFirst( Nm: in Name) return String is
  begin
    return Nm.MyFirst;
  end getFirst;

  ----------------------------------------------
  -- getMiddle(Name) retrieves Name as a String 
  -- Receive: Nm, a Name.        
  -- PRE: Nm has been initialized.
  -- Return: Nm.myMiddle. 
  ----------------------------------------------
  function getMiddle( Nm: in Name) return String is
  begin
     return Nm.MyMiddle;
  end getMiddle;

  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast       
  -- Receive: Nm, a Name.                    
  -- PRE: Nm has been initialized.            
  -- Return: Nm.myLast.                        
  ----------------------------------------------
  function getLast( Nm: in Name) return String is
  begin
     return Nm.MyLast;
  end getLast;

  ----------------------------------------------
  -- getFullName(Name) retrieves Name as a String -
  -- Receive: Nm, a Name.                      -
  -- PRE: Nm has been initialized.             -
  -- Return: a String representation of Nm.    -
  ----------------------------------------------
  function getFullName( Nm: in Name) return String is
  begin
    return Nm.MyFirst & " "
           & Nm.MyMiddle & " "
           & Nm.MyLast;
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: Nm has been initialized.             -
  -- Receive: Nm, a Name.                      -
  -- Output: Nm, to the screen.                -
  ----------------------------------------------
  procedure Put(Nm: in Name) is
  begin
    Put( getFullName(Nm) );
  end Put;

end Name_Package;]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ gnatmake nameTe  _tester.adb
x86_64-linux-gnu-gcc-7 -c name_tester.adb
x86_64-linux-gnu-gcc-7 -c name_package.adb
x86_64-linux-gnu-gnatbind-7 -x name_tester.ali
x86_64-linux-gnu-gnatlink-7 name_tester.ali
]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ ./name_tester
John     Paul     Jones   
All tests passed!
]0;jav86@remotel2: ~/CS214/labs/09/ada[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ada[00m$ exit

Script done on 2022-03-16 14:11:37-04:00 [COMMAND_EXIT_CODE="0"]
