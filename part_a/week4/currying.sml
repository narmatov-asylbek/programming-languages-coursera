
fun sorted3_tuple (x, y, z) = z >= y andalso y >= x

val t1 = sorted3_tuple(7, 9, 11)

fun sorted3 x y z = z >= y andalso y >= x
val t2 = sorted3 7 9 11


(* Partial application *)
val greater_than_0 = sorted3 0
val t3 = greater_than_0 5 8


fun range i j = if i > j then [] else i :: range(i + 1) j
val countup = range 1

val from_1_to_6 = countup 6


fun exists predicate xs = 
    case xs of
      [] => false
    | x::xs' => predicate x orelse exists predicate xs'

val has_zero = exists(fn x => x = 0)
val zeros = has_zero [1, 2, 3]

val removeZeros = List.filter(fn x => x <> 0)
val withRemovedZeros = removeZeros [0, 2, 4, 5, 0]