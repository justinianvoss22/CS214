Script started on 2022-04-06 13:37:13-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="123" LINES="24"]
]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ cat tasked_array_sum.adb
-- array_sum.adb sums the values from an input file using an array.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 04/07/22
--
-- Usage: array_sum <inFileName>
-------------------------------------------------------------------

with Ada.Text_IO,            -- string output
     Ada.Integer_Text_IO,    -- integer output
     Ada.Command_Line,       -- Argument()
     Ada.Real_Time;          -- Clock, Time, etc.

use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Real_Time;

procedure tasked_array_sum is

   package Long_IO is new Integer_IO(Long_Integer); use Long_IO;

   type Int_Array is array (Integer range <>) of Long_Integer;
   type Int_Array_Pointer is access Int_Array;

   Values: Int_Array_Pointer;
   Total:  Long_Integer;
   Start_Time, Stop_Time:  Ada.Real_Time.Time;
   Time_Required: Duration;

   task type Array_Adder_Task is 
      entry sum(ID, Slice_Size: in Integer);
      entry report(Result: out Long_Integer);
   end;

      -- Sum adds up the values in an array
   -- 
   -- Parameter: V, a pointer to an array of ints
   -- Return: the sum of the int values in V.
   --
   function Sum_Slice(V: in Int_Array_Pointer;
                        Start, Stop: in Integer) 
                        return Long_Integer is
      Partial_Sum: Long_Integer := 0;
   begin
         for i in Start..Stop loop
            Partial_Sum := Partial_Sum + V(i);
         end loop;
         return Partial_Sum;
   end Sum_Slice;

   task body Array_Adder_Task is
      My_Total : Long_Integer := 0;
      My_Start_Index, My_Stop_Index : Integer;
   begin
         accept sum(ID, Slice_Size: in Integer) do
            My_Start_Index := ID * Slice_Size;
            My_Stop_Index := My_Start_Index + Slice_Size - 1;
         end; 

         My_Total := Sum_Slice(Values, 
                                My_Start_Index,
                                My_Stop_Index);

         accept report(Result: out Long_Integer) do
            Result := My_Total;
         end; 
   end Array_Adder_Task;
   
   --
   -- check for command-line arguments
   --
   procedure Check_Command_Line is
   begin
      if Ada.Command_Line.Argument_Count /= 2 then
         New_line;
         Put("Usage: array_sum <inFileName> <numTasks>");
         New_line; New_line;
         Ada.Command_Line.Set_Exit_Status(1);
      end if;
   end Check_Command_Line;

   -- fill array with values from an input file
   -- Parameters: File_Name, a String
   --             V, a pointer to a dynamic array
   -- Precondition: File_Name is the name of a valid input file
   --            && its first line is the N, the number of
   --                (other) numbers in the file.
   -- Postcondition: V points to a dynamic array of length N
   --                 containing the N items from the input file.
   --
   procedure Read_File(File_Name: in String; V: in out Int_Array_Pointer) is
      Size:   Integer;
      Number_File : File_Type;
   begin
     Open(File => Number_File,
            Mode => In_File,
            Name => File_Name); 
      Get(Number_File, Size);
      V := new Int_Array(0..Size-1);
      for i in V'Range loop
         Get(Number_File, V(i));
      end loop;
   end Read_File;



   -- Output results
   -- Parameter: Result, the sum of the array's values
   --            Compute_Time, how long it took to sum them.
   -- Postcondition: Result and Compute_Time have been
   --                 displayed on the console.
   --
   procedure Display(Result: in Long_Integer; Compute_Time: in Duration) is
   begin
      New_line;
      Put("The sum is ");
      Put(Result);
      New_line;
      Put(" and computing it took "); 
      Put(Duration'Image (Compute_Time));
      Put(" secs.");
      New_line; New_line;
   end Display;

  -- Sums in parallel
   -- Parameter: Values, an Int_Array_Pointer, Num_Tasks, an integer
   -- Postcondition: Sums in parallel. Returns long integer
   --
   function Sum_In_Parallel(Values: in Int_Array_Pointer;
                            Num_Tasks: in Integer) return Long_Integer is
      Partial_Result, Result: Long_Integer := 0;
      Leftovers, Slice_Size, Start, Stop : Integer;

      type Task_Array is array(Integer range <>) of Array_Adder_Task;
      type Task_Array_Ptr is access Task_Array;
      Adder_Tasks : Task_Array_Ptr;

   begin
      Slice_Size := Values'Length / Num_Tasks;
      Adder_Tasks := new Task_Array(1..Num_Tasks-1);

      for task_ID in 1..NUM_TASKS-1 loop
         Adder_Tasks(task_ID).sum(task_ID, Slice_Size);
      end loop;

      Result := Sum_Slice(Values, 0, Slice_Size-1);

      Leftovers := Values'Length REM Num_Tasks;

      if ( Leftovers > 0 ) then
         Start := Values'Length - Leftovers;
         Stop := Values'Length - 1;
         for i in Start..Stop loop
            Result := Result + Values(i);
         end loop;
      end if;

      for task_ID in 1..Num_Tasks-1 loop
         Adder_Tasks(task_ID).report(Partial_Result);
         Result := Result + Partial_Result;
      end loop;

      return Result;
   end Sum_In_Parallel;


begin
   Check_Command_Line;
   Read_File( Ada.Command_Line.Argument(1), Values );
   Start_Time := Clock;
   Total := Sum_In_Parallel(Values,
                              Integer'Value( Ada.Command_Line.Argument(2) ) );
   Stop_Time := Clock;
   Time_Required := Ada.Real_Time.To_Duration(Stop_Time - Start_Time);
   Display(Total, Time_Required);
end tasked_array_sum;

]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ gnatmake tasked_array_sum.adb
gnatmake: "tasked_array_sum" up to date.
]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ gnatmake tasked_array_sum.adb[5Pcat tasked_array_sum.adbjava ThreadedArraySum /home/cs/214/labs/12/numbers/1000000numbers.txt 54321[1Pnumbers.txt 54321[1Pnumbers.txt 54321[1Pnumbers.txt 54321[3P5numbers.txt 54321[25Pc -deprecation ThreadedArraySum.java ThreadedArraySum /home/cs/214/labs/12/numbers/5numbers.txt 1[4PArraySum /home/cs/214/labs/12/numbers/1000000numbers.txt[1Pnumbers.txt[1Pnumbers.txt[1Pnumbers.txt[3P5numbers.txt[23Pc -deprecation ArraySum.java Sum /home/cs/214/labs/12/numbers/1000000numbers.txt[1Pnumbers.txt[1Pnumbers.txt[4P5numbers.txt[3@1000numbers.txt[1Phome/cs/214/labs/12/numbers/1000numbers.txt[2@./java Sum home/cs/214/labs/12/numbers/1000numbers.txt[30Pjava Sum 1000numbers.txt[11@../numbers/1000numbers.txt[K home/jav86/CS214/labs/12/java/5numbers.txt[1@cs/214/labs/12/numbers/1000numbers.txt[11P5numbers.txt[8@numbers/5numbers.txt[5Pcs/214/labs/12/numbers/5numbers.txt./java Sum[K cs/214/labs/12/numbers/5numbers.txt[4P Sum cs/214/labs/12/numbers/5numbers.txt[15Pjavac -deprecation Sum.javacd java[KCS214/labs/12[9P./shell[15@g++ *.cpp *.h -o shell./shell[Kcd CS214/labs/12java[K[20@javac -deprecation Sum.java./ Sum cs/214/labs/12/numbers/5numbers.txt[4@java Sum cs/214/labs/12/numbers/5numbers.txt[Kjava Sum cs/214/labs/12/numbers/5numbers.txt[5@home/cs/214/labs/12/numbers/5numbers.txt[8P5numbers.txt[11@numbers/1000numbers.txt[1Pjav86/CS214/labs/12/java/5numbers.txt[K ../numbers/1000numbers.txt[11P1000numbers.txt[30@./java Sum home/cs/214/labs/12/numbers/1000numbers.txt[2Pjava Sum home/cs/214/labs/12/numbers/1000numbers.txt[1@/home/cs/214/labs/12/numbers/1000numbers.txt[3P5numbers.txt[4@10000numbers.txt[1@0numbers.txt[1@0numbers.txt[24Pc -deprecation ArraySum.java ArraySum /home/cs/214/labs/12/numbers/5numbers.txt[3@1000numbers.txt[1@0numbers.txt[1@0numbers.txt[1@0numbers.txtThreadedArraySum /home/cs/214/labs/12/numbers/5numbers.txt 1[25Pc -deprecation ThreadedArraySum.java ThreadedArraySum /home/cs/214/labs/12/numbers/5numbers.txt 123451000numbers.txt 123u[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1P[1Pm[1P[1@t[1@a[1P[1P[1@.[1@/[1@t[1@a[1@s[1@k[1@e[1@d[1@_[1@a[1@r[1@r[1@a[1@y[1@_[1@s[1@u[1@m [1@  /home/cs/214/labs/12/numbers/1000numbers.txt 3 1

The sum is                50104
 and computing it took  0.000023919 secs.

]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ [K./tasked_array_sum  /home/cs/214/labs/12/numbers/1000numbers.txt 1 44 1[1P[1P[1P[1@0[1@0[1@0[1@0[1@0[1@0

The sum is             50473230
 and computing it took  0.002102630 secs.

]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ [K./tasked_array_sum  /home/cs/214/labs/12/numbers/1000000numbers.txt 1 4

The sum is             50473230
 and computing it took  0.000953366 secs.

]0;jav86@gold30: ~/CS214/labs/12/ada[01;32mjav86@gold30[00m:[01;34m~/CS214/labs/12/ada[00m$ [Kexit

Script done on 2022-04-06 13:39:05-04:00 [COMMAND_EXIT_CODE="0"]
