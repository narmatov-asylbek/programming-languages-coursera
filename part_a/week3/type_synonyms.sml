type pair = int * int
type date = int * int * int
type s = string

val hello: pair = (88, 99)



(* Recursive Linked List Datatype *)
datatype int_list = Empty | Cons of int * int_list

val x = Cons(4, Cons(23, Cons(2008, Empty)))

fun append_linked_list(xs, ys) = 
    case xs of
    Empty => ys
    | Cons (x, xs') => Cons(x, append_linked_list(xs', ys))
