val x = ref 42
val y = ref 42

val z = x
val _ = x := 43 (* Change x value to 43 *)
val w = (!y) + (!z) (* Retrive the data *)