datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(4, 5)
val e = a

fun f x = 
    case x of 
        Pizza => 3
      | Str s => 8
      | TwoInts(int1, int2) => int1 + int2


val result = f d;