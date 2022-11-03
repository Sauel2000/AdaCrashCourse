package body movementPro is

   
   procedure changingDirection(carDirection : setDirection) is
   begin
   case carDirection is
      when ahead => movementPro.front;
           Put_Line("forward");
      when backward => movementPro.back;
           Put_Line("backward");
      when left => movementPro.left;
           Put_Line("left");
      when right => movementPro.right;
           Put_Line("right");
      end case;
   end changingDirection;
   
 
   procedure front is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end front;
   
   procedure back is
      Forward : constant Boolean := False; -- forward is true, backward is false
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end back;
   procedure left is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end left;
   procedure right is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end right;
   
   procedure forwardLeft is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end forwardLeft;
   
   procedure forwardRight is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end forwardRight;
   procedure backwardRight is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end backwardRight;
   
   procedure backwardLeft is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end backwardLeft;
   
   procedure rotLeft is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end rotLeft;
   procedure rotRight is

   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end rotRight;
   
   procedure curvedRight is
      SpeedRight : constant MicroBit.IOsForTasking.Analog_Value := 370; --between 0 and 1023
      SpeedLeft : constant MicroBit.IOsForTasking.Analog_Value := 1023; --between 0 and 1023
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, SpeedLeft); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, SpeedRight); --right speed control ENA ENB
   end curvedRight;
   procedure lateralArcRight is
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end lateralArcRight;

   procedure lateralArcLeft is
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
   --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
   --RIGHT
   --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

   --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end lateralArcLeft;
   task body k is 
      myClock : Time;
   begin
      loop
         myClock := Clock;
         changingDirection(left);
         delay until myClock + Milliseconds(200);
      end loop;
   end k;

end movementPro;
