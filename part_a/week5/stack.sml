signature STACK =
sig
  exception E
  type 'a stack

  val new: 'a stack
  val push: 'a -> 'a stack -> 'a stack
  val pop: 'a stack -> 'a stack
  val top: 'a stack -> 'a
end

structure Stack :> STACK = struct
exception E
type 'a stack = 'a list
val new = []
fun push x xs = x :: xs
fun pop xs = 
    case xs of
      [] => raise E
    | x :: [] => []
    | x :: xs' => xs'

fun top xs =
    case xs of
      [] => raise E
    | x :: _ => x
end

val MyEmptyStack = Stack.new;
val MyStack0 = Stack.push 0 MyEmptyStack;


val hello = [(4,19), (1,20), (74,75)]

fun some xs = 
    case xs of
     (a,b)::(c,d)::(e,f)::g => 1
    | _ => 0

val res = some hello

