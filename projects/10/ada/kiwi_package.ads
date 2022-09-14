-- kiwi_package.ads gives Kiwi-related declarations,
--  and derives Kiwi from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 03/24/2022
---------------------------------------------------
with Bird_Package; use Bird_Package;
with Walking_Bird_Package; use Walking_Bird_Package;

package Kiwi_Package is
type Kiwi_Type is new Walking_Bird with private;

 ----------------------------------------------------
 -- A Kiwi's Call (Over-rides Bird.Call())          -
 -- Receive: A_Kiwi, a Kiwi_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
function  Call(A_Kiwi : in Kiwi_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
 -- Receive: A_Kiwi, a Kiwi_Type.                          -
 -- Return: "Kiwi".                                        -
 -----------------------------------------------------------
function  Type_Name(A_Kiwi : in Kiwi_Type) return String;

private
 type Kiwi_Type is new Walking_Bird with
          record
            null;
          end record;

end Kiwi_Package;