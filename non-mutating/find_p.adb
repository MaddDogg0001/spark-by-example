-- implementation of a better version of Find

package body Find_P with
     Spark_Mode is

   function Find (A : T_Arr; Val : T) return Option is
      Result : Option := (Exists => False);
   begin
      for I in A'Range loop
         if A (I) = Val then
            Result := (Exists => True, Value => I);

            return Result;
         end if;

         pragma Loop_Invariant (not Has_Value (A (A'First .. I), Val));
         pragma Loop_Invariant (not Result.Exists);
      end loop;

      return Result;
   end Find;
end Find_P;
