-- implementation of Search without ghost funtions

package body Search_Wo_Ghost_P with
     Spark_Mode is

   function Search (A : T_Arr; B : T_Arr) return Option is
      Result : Option := (Exists => False);
   begin
      if (A'Length < B'Length or else B'Length = 0) then
         return Result;
      end if;

      for I in A'First .. A'Last + 1 - B'Length loop
         if A (I .. I - 1 + B'Length) = B then
            Result := (Exists => True, Value => I);

            return Result;
         end if;

         pragma Loop_Invariant
           (for all J in A'First .. I => A (J .. J - 1 + B'Length) /= B);
         pragma Loop_Invariant (not Result.Exists);
      end loop;

      return Result;
   end Search;

end Search_Wo_Ghost_P;
