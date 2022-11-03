with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.IOsForTasking;
--with MicroBit.Console; use MicroBit.Console;
with Ada.Text_IO; use Ada.Text_IO;

package movementPro is
   Speed : constant MicroBit.IOsForTasking.Analog_Value := 1023; --between 0 and 1023
   Forward : constant Boolean := True; -- forward is true, backward is false
   type setDirection is (ahead, backward, left, right);

   task k with Priority => 1;
   procedure changingDirection(carDirection : setDirection);
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
