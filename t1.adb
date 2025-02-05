pragma SPARK_Mode (On);
package body T1 is

   ----------
   -- Swap --
   ----------

   procedure Swap (X : in out Integer; Y : in out Integer) is
      Temp : Integer;
   begin
--      Temp := X;
      X := Y;
      Y := Temp;
--      Y := X;
   end Swap;

end T1;
