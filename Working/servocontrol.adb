package body servoControl is

   procedure turnStart is
      servo : Pin_Id := 4;
      setpoint : Servo_Set_Point:=115;
   begin
      
         
         MicroBit.Servos.Go(servo, setpoint);
      
         delay(0.02);

      
   end turnStart;
   procedure turn0 is
      servo : Pin_Id := 4;
      setpoint : Servo_Set_Point:=0;
   begin
      
         
         MicroBit.Servos.Go(servo, setpoint);
      
         delay(0.02);

      
   end turn0;
   procedure turn180 is
      servo : Pin_Id := 4;
      setpoint : Servo_Set_Point:=180;
   begin
      
         
         MicroBit.Servos.Go(servo, setpoint);
      
         delay(0.02);

      
   end turn180;
   

end servoControl;
