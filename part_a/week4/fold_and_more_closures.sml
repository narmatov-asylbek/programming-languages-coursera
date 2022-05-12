fun fold (f, acc, xs) = 
    case xs of
      [] => acc
    | x :: xs' => fold(f, f(acc, x), xs')


fun sum1 xs = fold((fn (x, y) => x + y), 0, xs)


(* Pipelining operator *)
infix !>

fun x !> f = f x

fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt