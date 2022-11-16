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
      Distance : Distance_cm :=0;
      myClock : Time;
      
   begin
      Ultrasonic.Setup(10,11);      
      loop
         myClock := Clock;
         Distance := Ultrasonic.Read;
         Put_Line ("Read" & Distance_cm'Image(Distance));
         if Distance >200 then
            MotorDriver.SetDirection (ahead);
            delay until myClock + Milliseconds(200);
         end if;
         if Distance < 16 then
            MotorDriver.SetDirection(stop);
            delay until myClock + Milliseconds(200);
            servoControl.turnStart;
            delay until myClock + Milliseconds(400);
            servoControl.turn0;
            delay until myClock + Milliseconds(600);
            servoControl.turn180;
            delay until myClock + Milliseconds(800);
         else
            MotorDriver.SetDirection(ahead);
            delay until myClock + Milliseconds(200);
         end if;
         delay until myClock + Milliseconds(100);
      end loop;
   end sense;

   task body think is
      myClock : Time;
      
   begin
      loop
         myClock := Clock;
         
         Put_Line("THINKING");
         
         delay until myClock + Milliseconds(100);
      end loop;
   end think;
   
   task body act is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         
       
         Put_Line ("Direction is: " & Direction'Image (MotorDriver.GetDirection));
         directionControl(MotorDriver.GetDirection);
         delay until myClock + Milliseconds(200);
      end loop;
   end act;
   
   protected body MotorDriver is
      --  procedures can modify the data
      procedure SetDirection (carDirection : Direction) is
      begin
         DriveDirection := carDirection;
      end SetDirection;
      --  functions cannot modify the data
      function GetDirection return Direction is
      begin
         return DriveDirection;
      end GetDirection;
   end MotorDriver;
   

end mycontroller_empty;
