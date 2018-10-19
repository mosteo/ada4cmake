with Interfaces.C;

package Lib_Test is

   pragma Pure;

   function Ada_Add (A, B : Interfaces.C.Int) return Interfaces.C.Int
     with Export, Convention => C;

end Lib_Test;
