with Ultrasonic; use Ultrasonic;
with movementpro;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Ultrasonic; use Ultrasonic;
with myMusic; use myMusic;
package mycontroller_empty is
   type Direction is (ahead, backward, leftSide, rightSide,rotRight,stop);
   procedure directionControl(carDirection : Direction);
   task Sense with Priority => 3;
  
   task Think with Priority=> 1; -- what happens for the set direction if think and sense have the same prio and period?
   -- what happens if think has a higher priority? Why is think' set direction overwritten by sense' set direction?
   
   task Act with Priority=> 2;

   protected MotorDriver is
      function GetDirection return Direction;
      procedure SetDirection (carDirection : Direction);
   private
      DriveDirection : Direction;
   end MotorDriver;
   

end mycontroller_empty;
