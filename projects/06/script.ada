Script started on 2022-02-17 15:33:32-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ cat s quad_roots.ada
cat: quad_roots.ada: No such file or directory
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ cat uq  quad_roots.adb
-- quad_roots.adb computes the roots of an equation
--
-- Input: floats a, b, c, root1, root2, and args
-- Output: The roots of the numbers given for the quadratic equation

-- Completed by: Justin Voss
-- Date: 02/17/22
--------------------------------------------------------------




with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;


procedure quad_roots is
    a, b, c, args, root1, root2: Float;



    procedure quadratic_roots(a : in  Float; b : in Float; c : Float; root1 : out Float; root2 : out Float ) is  -- takes in many float values as parameters
        begin
            if a /= 0.0 then  -- checks if a is zero
                args := (b ** 2) - (4.0 * a * c); 
                if args >= 0.0 then
                    root1 := (-b + Sqrt(args)) / (2.0*a);
                    root2 := (-b - Sqrt(args)) / (2.0*a);
                else
                    Put("\n*** quadraticRoots(): b^2 - 4ac is negative!");
                    root1 := 0.0;  -- roots are reset to 0
                    root2 := 0.0;
                end if;
            else
                Put( "\n*** QuadraticRoots(): a is zero!");
                root1 := 0.0;    -- roots are reset to 0
                root2 := 0.0;
                
            end if;

        end quadratic_roots; 


begin                                           
    Put("Enter a: ");  -- Prompt for input
    Get(a);
    Put("Enter b: ");
    Get(b);
    Put("Enter c: ");
    Get(c);
    quadratic_roots(a, b, c, root1, root2);  -- calls the function
    if root1 /= 0.0 then    -- compares root1 to zero to check if the roots are valid. They are reset to 0 if they are not valid.
        Put("Roots are ");  -- only prints out when the roots are valid
        Put(root1);
        Put(" and ");
        Put(root2);
    end if;
end quad_roots;]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ gnatmake quad_roots.adb
gnatmake: "quad_roots" up to date.
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ ./quadA+  _roots
Enter a: 1
Enter b: 4
Enter c: 3
Roots are -1.00000E+00 and -3.00000E+00
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ ./quad_roots
Enter a: 1
Enter b: 20
Enter c: 40
Roots are -2.25403E+00 and -1.77460E+01
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ ./quad_roots
Enter a: 0
Enter b: 10
Enter c: 0 409 
\n*** QuadraticRoots(): a is zero!
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ ./quad_roots
Enter a: 1
Enter b: 2
Enter c: 3
\n*** quadraticRoots(): b^2 - 4ac is negative!
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ exit

Script done on 2022-02-17 15:35:02-05:00 [COMMAND_EXIT_CODE="0"]
