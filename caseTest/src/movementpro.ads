with Ada.Real_Time; use Ada.Real_Time;
package movementPro is
   task k with Priority => 1;
   procedure changingDirection;
   procedure front;
   procedure back;
   procedure right;
   procedure left;
   procedure forwardLeft;
   procedure forwardRight;
   procedure backwardRight;
   procedure backwardLeft;
   procedure rotLeft;
   procedure rotRight;
   procedure curvedRight;
   procedure lateralArcRight;
   procedure lateralArcLeft;
end movementPro;
