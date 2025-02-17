pragma SPARK_Mode;
package Explore is
   procedure UE1 (I : in out Integer);
   --  Unconditional data-flow errors 20, 23.
   --  Suplimentary error 32 - Neither imported or defined.
   --  Dependencies error 602 - Exported value derived from uninitialized local.
   procedure CE1 (I : in out Integer);
   --  Conditional deata-flow errors 501, 504.
   --  Dependencies error 602 - Exported value derived from uninitialized local.
   procedure BE1 (I : in out Integer);
   --  Blocking statements
   --  Unconditional data-flow errors 20.
   --  Dependencies error 602 - Exported value derived from uninitialized local.
   procedure UA1 (I : in out Integer);
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA2 (I : in out Integer);
   --  Ineffective statement in loop.
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA3 (I : in out Integer);
   --  Ineffective statement before loop entry.
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA4 (I : in out Integer);
   --  Ineffective statement before loop entry containing if-then-else.
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA5 (I : in out Integer);

   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA6 (I : in out Integer);
   procedure UA7 (I : in out Integer);
   procedure I1  (I : in out Integer);
   procedure I2  (I : in out Integer);
   procedure IO1 (I : in out Integer);
   procedure IO2 (I : in out Integer; J : in Integer);
   procedure IO3 (I : in out Integer; J : out Integer);
   procedure IO4 (I : in out Integer);
   procedure V1 (I : in out Integer);
   procedure V2 (I : in out Integer);
   procedure V3 (I : in out Integer);
   procedure V4 (I : in out Integer);
end Explore;
