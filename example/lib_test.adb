package body Lib_Test is

   use Interfaces.C;

   function Ada_Add (A, B: Int) return Int is
   begin
      return A + B;
   end Ada_Add;

end Lib_Test;
