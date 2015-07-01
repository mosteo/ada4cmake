with Interfaces.C;

package Lib_Test is

   pragma Pure;

   function Give return Interfaces.C.Int;
   pragma Export(C, Give);

end Lib_Test;
