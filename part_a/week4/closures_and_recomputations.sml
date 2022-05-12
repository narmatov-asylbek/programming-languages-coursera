fun filter (f, xs) = 
    case xs of
      [] => []
    | x :: xs' => if f x then x :: filter(f, xs') else filter(f, xs')


(* Computues the size of s every time even if it's not changed *)
fun allShorterThan1(xs, s) = 
    filter(fn x => String.size x < String.size s, xs)


(* Optimized version of the same function. Doesn't compute size of s because it's constant *)
fun allShorterThan2(xs, s) = 
    let
        val i = String.size s
    in 
        filter(fn x => String.size x < i, xs)
    end
