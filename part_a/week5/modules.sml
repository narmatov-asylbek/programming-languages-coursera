signature RATIONAL1 = sig
type rational
exception BadFrac

val make_frac: int * int -> rational
end

structure Rational1 :> RATIONAL1 = struct
datatype rational = Whole of int | Frac of int * int
exception BadFrac

fun gcd(x, y) = 
    if x = y
    then x
    else if x < y
    then gcd(x, y - x)
    else gcd(y, x)

fun reduce r = 
    case r of
      Whole _ => r
    | Frac (x, y) =>
        if x = 0
        then Whole 0
        else let val d = gcd(abs x, y) in
                 if d = y
                 then Whole(x div y)
                 else Frac(x div d, y div d)
            end

fun make_frac(x, y) =
    if y = 0
    then raise BadFrac
    else if y < 0
    then reduce(Frac(~x, ~y))
    else reduce(Frac(x, y))

end