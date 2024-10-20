pragma Ada_2012;
package body T1 is

   ----------
   -- Swap --
   ----------

   procedure Swap (X : in out Integer; Y : in out Integer) is
      Temp : Integer;
   begin
      Temp := X;
      X := Y;
      Y := Temp;
   end Swap;

end T1;
