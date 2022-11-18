with Ultrasonic; use Ultrasonic;
with movementpro;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Ultrasonic; use Ultrasonic;
--with myMusic; use myMusic;
with MicroBit.Servos; use MicroBit.Servos;
with Ada.Execution_Time; use Ada.Execution_Time;
package mycontroller_empty is
   
   type Direction is (ahead, backward, leftSide, rightSide,rotRight,stop);
   type availableAngle is (Angle);
   procedure directionControl(carDirection : Direction);
   task Sense with Priority => 3;
  
   task Think with Priority=> 2; -- what happens for the set direction if think and sense have the same prio and period?
   -- what happens if think has a higher priority? Why is think' set direction overwritten by sense' set direction?
   
   task Act with Priority=> 1;

   protected MotorDriver is
      function GetDirection return Direction;
      procedure SetDirection (carDirection : Direction);
      procedure SetServoAngle (servoAngle : Servo_Set_Point);
      procedure SetDistance (Distance : Distance_cm);
      procedure SetRotationState (State : Boolean);
      function GetAngle return Servo_Set_Point;
      function GetDistance return Distance_cm;
      function GetRotationState return Boolean;
   private
      DriveDirection : Direction;
      angleToRotate : Servo_Set_Point;
      DistanceAhead : Distance_cm;
      rotationState : Boolean;
   end MotorDriver;
   

end mycontroller_empty;
