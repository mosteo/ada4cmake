package body Lib_Test is

   ----------
   -- Give --
   ----------

   function Give return Interfaces.C.Int is
   begin
      return 69;
   end Give;

   procedure Take is
   begin
      null;
   end;

end Lib_Test;
