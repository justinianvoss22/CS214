-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 3/10/22
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

NAME_SIZE : Constant Integer := 8;

type Name is
  record
    MyFirst : String(1..Name_Size);
    MyMiddle : String(1..Name_Size);
    MyLast : String(1..Name_Size);
  end record;


  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  -- replace this line with the definition of Init()
  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
    TheName.MyFirst := First;
    TheName.MyMiddle := Middle;
    TheName.MyLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName : in Name) return String is
   begin
      return TheName.MyFirst;
   end getFirst;


  function getMiddle(TheName : in Name) return String is
   begin
      return TheName.MyMiddle;
   end getMiddle;


  function getLast(TheName : in Name) return String is
   begin
      return TheName.MyLast;
   end getLast;

   -- sets the name of a myFirst
   procedure setFirst(First : in String; TheName : out Name) is
   begin
     TheName.myFirst := First;
   end setFirst;

   -- sets the name of a myMiddle
    procedure setMiddle(Middle : in String; TheName : out Name) is
   begin
     TheName.myMiddle := Middle;
   end setMiddle;

   -- sets the name of a myLast
    procedure setLast(Last : in String; TheName : out Name) is
   begin
     TheName.myLast := Last;
   end setLast;


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName : in Name) return String is
   begin
      return TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast;
   end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------
  procedure Put(TheName : in Name) is
   begin
   -- outputs the name
      Put(TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast);
   end Put;


----------------------------------------------
  --lfmi(Name) puts the name in first, last, middle initial form       -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.   
  -- Output: the name in the lfmi form.              -
  ----------------------------------------------
function lfmi(TheName : in Name) return String is
   begin
    -- The_Name.Middle'First accesses the first character of the middle
      return TheName.MyLast & ", " & TheName.MyFirst & TheName.MyMiddle(TheName.MyMiddle'First) & ".";
   end lfmi;


   ----------------------------------------------
  -- Read(Name) takes user input and puts it into a first, middle, and last name         -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  ----------------------------------------------
  procedure Read(TheName : in out Name) is
   -- makes word with proper length
   word : String := "        ";
   -- natural number to keep track of the current char
   begin
      -- gets the words from user
      Get(word);
      TheName.MyFirst := word;
      Get(word);
      TheName.MyMiddle := word;
      Get(word);
      TheName.MyLast := word;
   end Read;
  


begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

   Put(aName); New_line;

   -- testing mutator functions
   setFirst("Chris   ", aName);
   pragma Assert( getFirst(aName) = "Chris   ", "getFirst() failed");
   setMiddle("Robert  ", aName);
   pragma Assert( getMiddle(aName) = "Robert  ", "getMiddle() failed");
   setLast("Evans   ", aName);
   pragma Assert( getLast(aName) = "Evans   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "Chris    Robert   Evans   ", 
                    "getFullName() failed");

   -- testing lfmi
   Put("Should produce:"); New_line;
   Put("Chris   , Evans   R."); New_line;
   Put("Produces: "); New_line;
   Put(lfmi(aName)); New_line;
   pragma Assert( lfmi(aName) = "Evans   , Chris   R.", "lfmi() failed");

   -- testing the read function
   Put(aName); New_line;
   Put("Enter a first, middle, and last name: "); New_line;
   Read(aName);
   Put(aName); New_line;
   Put(aName); New_line;

   

   Put("All tests passed!"); New_line;

end name_tester;

