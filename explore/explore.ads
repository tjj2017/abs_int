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
   --  Ineffective value returned from subprogram call
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   --  Unconditional data-flow anomally 10 - Assignment to V is ineffective.
   procedure UA6 (I : in out Integer);
   --  Ineffective blocking statement
   --  Unconditional data-flow anomally 10 - Ineffective statement.
   procedure UA7 (I : in out Integer);
   --  Ineffective initialization due to blocking statement.
   --  Unconditional data-flow anomally 54 - The initialization at declaration of V is ineffective.
   procedure I1  (I : in out Integer);
   --  Invariant conditions
   --  Flow-Anomally  22 - Value of expression is invariant.
   --  Flow-Anomally  40 - Exit condition is stable, of index 0.
   --  Flow-Anomally  40 - Exit condition is stable, of index 1.
   procedure I2  (I : in out Integer);
   --  Invariant expressions in loops
   --  Flow-Anomally  41 - Expression is stable, of index 0.
   --  Flow-Anomally  41 - Expression is stable, of index 1
   procedure IO1 (I : in out Integer);
   --  Mode in out parameter neither Read nor Updated.
   --  Flow-Error  35 - Importation of the initial value of variable I is ineffective.
   --  Flow-Error  31 - The variable I is exported but not (internally) defined.
   procedure IO2 (I : in out Integer; J : in Integer);
   --  Unused mode in parameter.
   --  Flow Error  30 - The variable J is imported but neither referenced nor exported.
   procedure IO3 (I : in out Integer; J : out Integer);
   --  Unused mode out parameter.
   --  Flow Error  32 - The variable J is neither imported nor defined.
   --  Flow Error  31 - The variable J is exported but not (internally) defined.
   procedure IO4 (I : in out Integer);
   --  Local variable assigned but not used in determining any output.
   --  Flow-Anomally  10 - Ineffective statement.
   --  Flow Anomally  33 - The variable V is neither referenced nor exported.
   procedure V1 (I : in out Integer);
   --  Global mode in variable assigned.
   --  Flow-Anomaly  10 - Ineffective statement.
   --  Flow-Error  34 - The imported, non-exported variable J may be redefined.
   --  Warning 403 - J is declared as a variable but used as a constant.
   procedure V2 (I : in out Integer);
   --  Unused local varible.
   --  Warning 400 - Variable J is declared but not used.
   procedure V3 (I : in out Integer);
   --  Local variable initialized but not used.
   --  Flow-Anomally  54 - The initialization at declaration of J is ineffective.
   procedure V4 (I : in out Integer);
   --  Local constant not used.
   --  No warnings or messages.
end Explore;
