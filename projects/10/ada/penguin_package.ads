-- penguin_package.ads gives Penguin-related declarations,
--  and derives Penguin from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 03/24/2022
---------------------------------------------------
with Bird_Package; use Bird_Package;
with Walking_Bird_Package; use Walking_Bird_Package;

package Penguin_Package is
type Penguin_Type is new Walking_Bird with private;

 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())          -
 -- Receive: A_Penguin, a Penguin_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
function  Call(A_Penguin : in Penguin_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
 -- Receive: A_Penguin, a Penguin_Type.                          -
 -- Return: "Penguin".                                        -
 -----------------------------------------------------------
function  Type_Name(A_Penguin : in Penguin_Type) return String;

private
 type Penguin_Type is new Walking_Bird with
          record
            null;
          end record;

end Penguin_Package;