pragma SPARK_Mode;
package body Explore is

   ---------
   -- UE1 --
   ---------

   procedure UE1 (I : in out Integer) is
      U1 : Integer;
      U2 : Integer;
      U3 : Integer;
      subtype Index is Integer range 1 .. 3;
      type Atype is array (Index) of Integer;
      A : Atype := Atype'(0, 0, 0);
      procedure UE1_1 (J : in out Integer) is
      begin
         J  := J + 1;
      end UE1_1;

   begin
      A (U3) := I;
      UE1_1 (U1);
      I := A (U3) + U1;
      I := I + U2;
   end UE1;

--  1	explore.adb:21:14: high: "U3" is not initialized[#2]
--  2	explore.adb:17:16: high: "U1" is not initialized, in call inlined at explore.adb:22[#0]
--  2	explore.adb:22:14: warning: "U1" may be referenced before it has a value [enabled by default] 	c?
--  3	explore.adb:23:15: high: "U3" is not initialized[#3]
--  4	explore.adb:24:16: high: "U2" is not initialized[#1]
--  5	explore.adb:10:07: warning: variable "U2" is read but never assigned [-gnatwv]	c
--  6	explore.adb:11:07: warning: variable "U3" is read but never assigned [-gnatwv]	c

--  1	explore.adb:21:7: Flow Error  23 - Statement contains reference(s) to variable U3 which has an undefined value.
--  2	explore.adb:22:7: Flow Error  23 - Statement contains reference(s) to variable U1 which has an undefined value.
--  3	explore.adb:23:12: Flow Error  20 - Expression contains reference(s) to variable U3 which has an undefined value.
--  4	explore.adb:24:12: Flow Error  20 - Expression contains reference(s) to variable U2 which has an undefined value.
--  5	explore.adb:25:8: Flow Error  32 - The variable U2 is neither imported nor defined.
--  6	explore.adb:25:8: Flow Error  32 - The variable U3 is neither imported nor defined.
--  7	explore.adb:25:8: Flow Error 602 - The undefined initial value of U1 may be used in the derivation of I.
--  8	explore.adb:25:8: Flow Error 602 - The undefined initial value of U2 may be used in the derivation of I.
--  9	explore.adb:25:8: Flow Error 602 - The undefined initial value of U3 may be used in the derivation of I.


   ---------
   -- CE1 --
   ---------

   procedure CE1 (I : in out Integer) is
      U1 : Integer;
      U2 : Integer;
      U3 : Integer;
      subtype Index is Integer range 1 .. 3;
      type Atype is array (Index) of Integer;
      A : Atype := Atype'(0, 0, 0);
      procedure CE1_1 (J : in out Integer) is
      begin
         J  := J + 1;
      end CE1_1;

   begin
      if I = 0 then
         U1 := 1;
         U2 := 2;
         U3 := 3;
      end if;

      A (U3) := I;
      CE1_1 (U1);
      I := A (U3) + U1;
      I := I + U2;
   end CE1;

--  1	explore.adb:69:14: medium: "U3" might not be initialized[#2]
--  2	explore.adb:59:16: medium: "U1" might not be initialized, in call inlined at explore.adb:70[#0]
--  3	explore.adb:71:15: medium: "U3" might not be initialized[#3]
--  4	explore.adb:72:16: medium: "U2" might not be initialized[#1]

--  1	explore.adb:69:7: Flow Error 504 - Statement contains reference(s) to variable U3, which may have an undefined value.
--  2	explore.adb:70:7: Flow Error 504 - Statement contains reference(s) to variable U1, which may have an undefined value.
--  3	explore.adb:71:12: Flow Error 501 - Expression contains reference(s) to variable U3, which may have an undefined value.
--  4	explore.adb:72:12: Flow Error 501 - Expression contains reference(s) to variable U2, which may have an undefined value.
--  5	explore.adb:73:8: Flow Error 602 - The undefined initial value of U1 may be used in the derivation of I.
--  6	explore.adb:73:8: Flow Error 602 - The undefined initial value of U2 may be used in the derivation of I.
--  7	explore.adb:73:8: Flow Error 602 - The undefined initial value of U3 may be used in the derivation of I.

   ---------
   -- UBE --
   ---------

   procedure BE1 (I : in out Integer) is
      B : Integer;
   begin
      while I > 0 loop
         I := I - B;
         B := I + 1;
      end loop;
   end BE1;

--  1	explore.adb:96:19: warning: "B" may be referenced before it has a value [enabled by default]
--  1	explore.adb:96:19: medium: "B" might not be initialized[#18]

--  1	explore.adb:96:15: Flow Error  20 - Expression contains reference(s) to variable B which has an undefined value.
--  2	explore.adb:99:8: Flow Error 602 - The undefined initial value of B may be used in the derivation of I.

   ---------
   -- UA1 --
   ---------

   procedure UA1 (I : in out Integer) is
      V : Integer;
   begin
      V := I;
      V := I + 1;
      I := V;
   end UA1;

--  1	explore.adb:114:09: warning: unused assignment[#19]

--  1	explore.adb:114:7: Flow Error  10 - Ineffective statement.

   ---------
   -- UA2 --
   ---------

   procedure UA2 (I : in out Integer) is
      V : Integer;
   begin
      V := I;
      while I > 0 loop
         V := I - 1;
         I := V;
      end loop;
   end UA2;

--  1	explore.adb:130:09: warning: unused assignment[#22]

--  1	explore.adb:130:7: Flow Error  10 - Ineffective statement.

   ---------
   -- UA3 --
   ---------

   procedure UA3 (I : in out Integer) is
      V : Integer;
   begin
      V := I;
      if I > 0 then
         V := I - 1;
         I := V;
      end if;
   end UA3;

--  1	explore.adb:148:09: warning: unused assignment[#1]

--  1	explore.adb:148:7: Flow Error  10 - Ineffective statement.

   ---------
   -- UA4 --
   ---------

   procedure UA4 (I : in out Integer) is
      V : Integer;
   begin
      V := I;
      if I > 0 then
         V := I - 1;
         I := V;
      else
         V := I - 2;
         I := V;
      end if;
   end UA4;

--  1	explore.adb:166:09: warning: unused assignment[#4]

--  1	explore.adb:166:7: Flow Error  10 - Ineffective statement.

   ---------
   -- UA5 --
   ---------

   procedure UA5 (I : in out Integer) is
      V : Integer;
      procedure UA5_1 (J : in out Integer) is
      begin
         J := J + 1;
      end UA5_1;
   begin
      V := I;
      UA5_1 (V);
      V := I + 1;
      I := V;
   end UA5;

--  1	explore.adb:191:09: warning: unused assignment[#5]
--  2	explore.adb:188:12: warning: unused assignment, in call inlined at explore.adb:192[#6]

--  1	explore.adb:191:7: Flow Error  10 - Ineffective statement.
--  2	explore.adb:192:7: Flow Error  10 - Assignment to V is ineffective.

   ---------
   -- UA6 --
   ---------

   procedure UA6 (I : in out Integer) is
      subtype Little is Integer range 1 .. 3;
      V : Integer;
   begin
      V := 0;
      for C in Little loop
         V := 1 + I;
         I := V + 2;
      end loop;
      I := I + V;
   end UA6;

--  1	explore.adb:211:09: warning: unused assignment[#8]

--  1	explore.adb:211:7: Flow Error  10 - Ineffective statement.

   ---------
   -- UA7 --
   ---------

   procedure UA7 (I : in out Integer) is
      subtype Little is Integer range 1 .. 3;
      V : Integer := 0;
   begin
     for C in Little loop
         V := 1 + I;
         I := V + 2;
      end loop;
      I := I + V;
   end UA7;

--  1	explore.adb:229:07: warning: initialization of "V" has no effect[#13]

--  1	explore.adb:229:22: Flow Error  54 - The initialization at declaration of V is ineffective.

   --------
   -- I1 --
   --------

   procedure I1 (I : in out Integer) is
      V : Integer := 0;
   begin
      if V > 0 then    -- V is invariant
         I := I + 1;
      end if;

      case V is        -- V is invariant
         when 0 => I := I + 1;
         when others => I := I + 2;
      end case;

      if V = 2 then    -- V is invariant
         I := I + 3;
      elsif V = 3 then -- V is invariant
         I := I + 4;
      end if;

      while V = 4 loop -- Exit condition is invariant
         I := I + 1;
      end loop;

      while V > 0 loop -- Exit condition invariant after 1 iteration
         I := I + 1;
         V := 2;
      end loop;

      while I < 0 loop -- Exit condition invariant
         V := V + 1;
      end loop;
      I := V;
   end I1;

-- SPARK 2014 - No errors or warnings

--  1	explore.adb:249:10: Flow Error  22 - Value of expression is invariant.
--  2	explore.adb:253:12: Flow Error  22 - Value of expression is invariant.
--  3	explore.adb:258:10: Flow Error  22 - Value of expression is invariant.
--  4	explore.adb:260:13: Flow Error  22 - Value of expression is invariant.
--  5	explore.adb:264:13: Flow Error  40 - Exit condition is stable, of index 0.
--  6	explore.adb:268:13: Flow Error  40 - Exit condition is stable, of index 1.
--  7	explore.adb:273:13: Flow Error  40 - Exit condition is stable, of index 0.

   --------
   -- I2 --
   --------

   procedure I2 (I : in out Integer) is
      V : Integer := 0;
   begin
      while I < 0 loop
         V := 1;        -- Value assigned to V is invariant
         I := I + 1;
      end loop;
      I := V + I;

      while I < 0 loop
         if V = 0 then
            I := I + 1;
         end if;
      end loop;

      while I < 0 loop
         if V = 0 then  -- Condition is invariant after 1 iteration
            I := I + 1;
         end if;
            V := 2;
      end loop;

      while I < 0 loop
         if V = 0 then  -- Condition is invariant after 1 iteration
            I := I + 1;
         elsif V = 2 then  -- Condition is invariant after 1 iteration
            I := I + 2;
         end if;
         V := 2;
      end loop;
   end I2;

-- SPARK 2014 - No errors or warnings

--  1	explore.adb:303:13: Flow Error  41 - Expression is stable, of index 0.
--  2	explore.adb:309:13: Flow Error  41 - Expression is stable, of index 1.
--  3	explore.adb:316:13: Flow Error  41 - Expression is stable, of index 1.
--  4	explore.adb:318:16: Flow Error  41 - Expression is stable, of index 1.

   ---------
   -- IO1 --
   ---------

   procedure IO1 (I : in out Integer) is
   begin
      null;
   end IO1;

   --  1	explore.ads:15:19: warning: unused variable "I"[#21]
   --  2	explore.ads:15:19: warning: "I" is not modified, could be IN[#20]

   --  1	explore.adb:339:8: Flow Error  35 - Importation of the initial value of variable I is ineffective.
   --  2	explore.adb:339:8: Flow Error  31 - The variable I is exported but not (internally) defined.

   ---------
   -- IO2 --
   ---------

   procedure IO2 (I : in out Integer; J : in Integer) is
   begin
      I := I + 1;
   end IO2;

--  1	explore.ads:16:39: warning: unused variable "J"[#23]

--  1	explore.adb:353:8: Flow Error  30 - The variable J is imported but neither referenced nor exported.

   ---------
   -- IO3 --
   ---------

   procedure IO3 (I : in out Integer; J : out Integer) is
   begin
      I := I + 1;
   end IO3;

--  1	explore.ads:17:39: warning: unused variable "J"[#2]
--  2	explore.ads:17:39: high: "J" is not initialized in "IO3"[#3]

--  1	explore.adb:366:8: Flow Error  32 - The variable J is neither imported nor defined.
--  2	explore.adb:366:8: Flow Error  31 - The variable J is exported but not (internally) defined.

   ---------
   -- IO4 --
   ---------

   procedure IO4 (I : in out Integer) is
      V : Integer;
   begin
      V := 4;
      I := I + 4;
   end IO4;

--  1	explore.adb:380:09: warning: unused assignment[#7]

--  1	explore.adb:380:7: Flow Error  10 - Ineffective statement.
--  2	explore.adb:382:8: Flow Error  33 - The variable V is neither referenced nor exported.

   --------
   -- V1 --
   --------

   procedure V1 (I : in out Integer) is
      J : Integer := 1;
      procedure V1_1 (I : in out Integer)
      --# global in J;
      is
      begin
         I := I + J;
         J := 4;
      end V1_1;
   begin
      V1_1 (I);
   end V1;

--  1	explore.adb:400:12: warning: unused assignment, in call inlined at explore.adb:403[#0]

--  1	explore.adb:400:10: Flow Error  10 - Ineffective statement.
--  2	explore.adb:401:11: Flow Error  34 - The imported, non-exported variable J may be redefined.
--  3	explore.adb:404:8: Warning 403 - J is declared as a variable but used as a constant.


   --------
   -- V2 --
   --------

   procedure V2 (I : in out Integer) is
      J : Integer;
   begin
      I := I + 1;
   end V2;

--  1	explore.adb:420:07: warning: unused variable "J"[#20]
--  2	explore.adb:420:07: warning: variable "J" is never read and never assigned [-gnatwv]

--  1	explore.adb:423:8: Warning 400 - Variable J is declared but not used.

   --------
   -- V3 --
   --------

   procedure V3 (I : in out Integer) is
      J: Integer := 6;
   begin
      I := I + 6;
   end V3;

--  1	explore.adb:435:07: warning: initialization of "J" has no effect[#19]

--  1	explore.adb:435:21: Flow Error  54 - The initialization at declaration of J is ineffective.

   --------
   -- V4 --
   --------

   procedure V4 (I : in out Integer) is
      J : constant Integer := 9;
   begin
      I := I + 1;
   end V4;

end Explore;
