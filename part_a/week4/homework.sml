exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
val only_capitals = List.filter (fn x => Char.isUpper(String.sub(x, 0)))
val longest_string1 = List.foldl (fn (x, y) => if String.size x > String.size y then x else y) ""
val longest_string2 = List.foldl (fn (x, y) => if String.size x >= String.size y then x else y) ""
fun longest_string_helper f xs = List.foldl f "" xs
val longest_string3 = longest_string_helper (fn (x, y) => if String.size x > String.size y then x else y) 
val longest_string4 = longest_string_helper (fn (x, y) => if String.size x >= String.size y then x else y) 
val longest_capitalized = longest_string3 o only_capitals
val rev_string = String.implode o List.rev o String.explode

fun first_answer f xs = 
    case xs of
      [] => raise NoAnswer
    | x :: xs' => case f(x) of 
                      NONE => first_answer f xs'
                    | SOME v => v

fun all_answers f xs = 
    let fun helper(acc, lst) = 
            case lst of
              [] => SOME acc
            | x :: xs' => case f(x) of
                            NONE => NONE
                          | SOME lst' => helper(acc @ lst', xs')
    in
        helper([], xs)
    end


val count_wildcards = g (fn () => 1) (fn x => 0)
val count_wild_and_variable_lengths = g (fn () => 1) (fn x => String.size x)
fun count_some_var(name, pattern) = g (fn () => 0)(fn x => if x = name then 1 else 0) pattern 
