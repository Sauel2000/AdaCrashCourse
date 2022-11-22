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
         Put_Line("Stop");
      when forwardLeft => movementpro.forwardLeft;
         Put_Line("ForwardLeft");
      when forwardRight => movementpro.forwardRight;
         Put_Line("ForwardRight");
      when rotLeft => movementpro.rotLeft;
      end case;
   end directionControl;

   task body sense is

      myClock : Time;
      
   begin
      Ultrasonic.Setup(10,11);      
      loop
         
         myClock := Clock;
         UltrasonicController.SetDistance(Read);
         Put_Line ("Read" & Distance_cm'Image(UltrasonicController.GetDistance));
         delay until myClock + Milliseconds(100);
         --myMusic.rock;
         --delay until myClock + Milliseconds(100);
         
      end loop;
   end sense;

   task body think is
      myClock : Time;
      isRightChecked : Boolean :=False;
      isLeftChecked : Boolean := False;
   begin
      loop
         myClock := Clock;
         
         if UltrasonicController.GetDistance < 30 then
            MotorController.SetRotationState(False);
            MotorController.SetDirection(stop);
            delay until myClock + Milliseconds(200);
            --CHECKING LEFT SIDE VIEW
            ServoController.SetServoAngle(100); --LEFT ANGLE
            delay until myClock + Milliseconds(300);
            if (UltrasonicController.GetDistance < 30) and (isLeftChecked=False) then
               MotorController.SetDirection(rotLeft);
               delay until myClock + Milliseconds(500);
               isRightChecked := True;
               isLeftChecked :=True;
            end if; 
            if (isRightChecked = False) and (isLeftChecked=True) then 
               ServoController.SetServoAngle(30);
               delay until myClock + Milliseconds(200);
               if UltrasonicController.GetDistance < 30 then
                  MotorController.SetDirection(rotRight);
                  delay until myClock + Milliseconds(500);
               end if;
            end if;
            ----CHECKING RIGHT SIDE VIEW
            --ServoController.SetServoAngle(30);
            --delay until myClock + Milliseconds(2000);
            --if UltrasonicController.GetDistance > 30 then
            --   MotorController.SetDirection(rotRight);
            --   delay until myClock + Milliseconds(275);
            --end if;
         else
            MotorController.SetDirection(ahead);
            delay until myClock + Milliseconds(125);
            ServoController.SetServoAngle(65);
            delay until myClock + Milliseconds(150);
         end if;
         --if UltrasonicController.GetDistance < 30 then
         --   delay until myClock + Milliseconds(200);
         --   if UltrasonicController.GetDistance <30 then
         --      MotorController.SetDirection(rotLeft);
         --     delay until myClock + Milliseconds(100);
         --   end if;
         --end if;
         --ServoController.SetServoAngle(30);
         --delay until myClock + Milliseconds(100);
         --CHEKING RIGHT SIDE VIEW 
         --if UltrasonicController.GetDistance <30 then
         --   ServoController.SetServoAngle(3); --RIGHT ANGLE
         --   delay until myClock + Milliseconds(200);

         --   ServoController.SetServoAngle(115); --BACK TO AHEAD ANGLE
         --   delay until myClock + Milliseconds(100);
         --   MotorController.SetRotationState(True);
         --   delay until myClock + Milliseconds(125);
         --else
         --   MotorController.SetDirection(ahead);
         --   delay until myClock + Milliseconds(25);
         --   ServoController.SetServoAngle(70); --RETURN TO AHEAD ANGLE
         --   delay until myClock + Milliseconds(200);
            
         --end if;
         --end if;
      end loop;
   end think;
   
   task body act is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         Put_Line ("Direction is: " & Direction'Image (MotorController.GetDirection));
         --directionControl(MotorController.GetDirection);
         --Put_Line ("Bool state: " & Boolean'Image (MotorController.GetRotationState));
         --delay until myClock + Milliseconds(10);
         if MotorController.GetRotationState = True then
            movementpro.rotRight;
            delay until myClock + Milliseconds(3200);
            MotorController.SetRotationState(False);
         end if;
      end loop;
   end act;
   
   protected body MotorController is
      --  procedures can modify the data
      procedure SetDirection (carDirection : Direction) is
      begin
         DriveDirection := carDirection;
      end SetDirection;
      procedure SetRotationState (State : Boolean) is
      begin
         rotationState:= State;
      end SetRotationState;
      --  functions cannot modify the data
      function GetDirection return Direction is
      begin
         return DriveDirection;
      end GetDirection;
      function GetRotationState return Boolean is
      begin
         return rotationState;
      end GetRotationState;
   end MotorController;
   protected body ServoController is
      procedure SetServoAngle (servoAngle : Servo_Set_Point) is
      begin
         servoControl.servoDegree(servoAngle);
         angleToRotate := servoAngle;
      end SetServoAngle;
      function GetAngle return Servo_Set_Point is
      begin
         return angleToRotate;
      end GetAngle;
   end ServoController;
   protected body UltrasonicController is
      procedure SetDistance (Distance : Distance_cm) is
      begin
         DistanceAhead := Distance;
      end SetDistance;
      function GetDistance return Distance_cm is
      begin
         return DistanceAhead;
      end GetDistance;
   end UltrasonicController;
end mycontroller_empty;
