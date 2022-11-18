with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with servoControl;


package body mycontroller_empty is
   procedure directionControl(carDirection : Direction) is
   begin
      case carDirection is
      when ahead => movementPro.front;
         Put_Line("forward");
      when backward => movementPro.back;
         Put_Line("backward");
      when leftSide => movementPro.left;
         Put_Line("left");
      when rightSide => movementPro.right;
         Put_Line("right");
      when rotRight => movementpro.rotRight;
         Put_Line("RotatingRight");
      when stop => movementpro.Stop;
      end case;
   end directionControl;

   task body sense is

      myClock : Time;
      
   begin
      Ultrasonic.Setup(10,11);      
      loop
         myClock := Clock;
         MotorDriver.SetDistance(Read);
         Put_Line ("Read" & Distance_cm'Image(MotorDriver.GetDistance));
         delay until myClock + Milliseconds(25);

      end loop;
   end sense;

   task body think is
      myClock : Time;
      
   begin
      loop
         myClock := Clock;
         if MotorDriver.GetDistance < 30 then
            MotorDriver.SetRotationState(False);
            MotorDriver.SetDirection(stop);
            delay until myClock + Milliseconds(50);
            MotorDriver.SetServoAngle(115); --AHEAD ANGLE
            delay until myClock + Milliseconds(75);
            MotorDriver.SetServoAngle(70); --RIGHT ANGLE
            delay until myClock + Milliseconds(100);
            MotorDriver.SetServoAngle(150); --LEFT ANGLE
            delay until myClock + Milliseconds(125);
            MotorDriver.SetServoAngle(115); --BACK TO AHEAD ANGLE
            delay until myClock + Milliseconds(150);
            MotorDriver.SetRotationState(True);
            delay until myClock + Milliseconds(175);
         else
            MotorDriver.SetDirection(ahead);
            delay until myClock + Milliseconds(25);
            MotorDriver.SetServoAngle(120); --RETURN TO AHEAD ANGLE
            delay until myClock + Milliseconds(50);
         end if;
      end loop;
   end think;
   
   task body act is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         Put_Line ("Direction is: " & Direction'Image (MotorDriver.GetDirection));
         directionControl(MotorDriver.GetDirection);
         Put_Line ("Bool state: " & Boolean'Image (MotorDriver.GetRotationState));
         delay until myClock + Milliseconds(10);
         if MotorDriver.GetRotationState = True then
            movementpro.rotRight;
            delay until myClock + Milliseconds(3200);
            MotorDriver.SetRotationState(False);
         end if;
      end loop;
   end act;
   
   protected body MotorDriver is
      --  procedures can modify the data
      procedure SetDirection (carDirection : Direction) is
      begin
         DriveDirection := carDirection;
      end SetDirection;
      procedure SetRotationState (State : Boolean) is
      begin
         rotationState:= State;
      end SetRotationState;
      procedure SetServoAngle (servoAngle : Servo_Set_Point) is
      begin
         servoControl.servoDegree(servoAngle);
         angleToRotate := servoAngle;
      end SetServoAngle;
      --  functions cannot modify the data
      procedure SetDistance (Distance : Distance_cm) is
      begin
         DistanceAhead := Distance;
         
      end SetDistance;
      function GetDirection return Direction is
      begin
         return DriveDirection;
      end GetDirection;
      function GetRotationState return Boolean is
      begin
         return rotationState;
      end GetRotationState;
      function GetDistance return Distance_cm is
      begin
         return DistanceAhead;
      end GetDistance;
      function GetAngle return Servo_Set_Point is
      begin
         return angleToRotate;
      end GetAngle;
   end MotorDriver;
   

end mycontroller_empty;
