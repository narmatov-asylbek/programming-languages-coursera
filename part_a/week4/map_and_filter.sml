(* Map *)
fun map (f, xs) = 
    case xs of
    [] => []
  | x::xs' => (f x) :: map(f, xs')

val x1 = map((fn x => x + 1), [4, 8, 10, 12])
val x2 = map(hd, [[1, 2, 3], [3, 4, 5], [10, 12]])



(* Filter *)
fun filter(f, xs) = 
    case xs of 
      [] => []
    | x :: xs' => if f x then x :: (filter (f, xs')) else filter(f, xs')


fun all_even xs = filter((fn v => v mod 2 = 0), xs)
val evens = all_even [1, 3, 6, 8, 10, 13]