(* Recursion function for factorial *)
fun fact n = 
    if n = 0
    then  1
    else n * fact(n - 1)

val x = fact 3


(* More complicated, but more efficient version of factorial *)

fun fact2 n = 
    let fun aux(n, acc) = 
            if n = 0
            then acc
            else aux(n - 1, acc*n)
    in
        aux(n, 1)
    end

val y = fact2 3



(* Anpther example of basic and optimized version *)

fun sum_list lst = 
    case lst of
      [] => 0
    | x::xs' => x + sum_list xs'


fun sum_list_optimized lst = 
    let
        fun sum(xs, acc) = 
            case xs of
              [] => acc
            | x::xs' => sum(xs', x + acc)
    in
        sum(lst, 0)
    end

(* Another example *)

fun rev lst = 
    case lst of
      [] => []
    | x::xs' => (rev lst) @ [x]

fun rev_opt xs = 
    let fun aux(xs, acc) = 
            case xs of 
              [] => acc
            | x::xs' => aux(xs', x::acc)
    in 
        aux(xs, [])
    end