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

   --------
   -- I1 --
   --------

   procedure I1 (I : in out Integer) is
      V : Integer := 0;
   begin
      if V > 0 then
         I := I + 1;
      end if;

      case V is
         when 0 => I := I + 1;
         when others => I := I + 2;
      end case;

      if V = 2 then
         I := I + 3;
      elsif V = 3 then
         I := I + 4;
      end if;

      while V = 4 loop
         I := I + 1;
      end loop;

      while V > 0 loop
         I := I + 1;
         V := 2;
      end loop;

 end I1;

end Explore;
