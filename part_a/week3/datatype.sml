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

datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp


(* First version. Too many recursive calls and duplicate codes *)
fun max_contant e = 
  case e of
      Constant i => i
    | Negate e2 => max_contant e2
    | Add(e1, e2) => if max_contant e1 > max_contant e2 then max_contant e1 else max_contant e2
    | Multiply(e1, e2) => if max_contant e1 > max_contant e2 then max_contant e1 else max_contant e2

(* Second version. Duplicates codes *)
fun max_contant2 e = 
  case e of
      Constant i => i
    | Negate e2 => max_contant2 e2
    | Add(e1, e2) =>
      let val m1 = max_contant2 e1
          val m2 = max_contant2 e2
      in if m1 > m2 then m1 else m2 end
    | Multiply(e1, e2) =>
      let val m1 = max_contant2 e1
          val m2 = max_contant2 e2
      in if m1 > m2 then m1 else m2 end

(* Third version. The most optimized. But we can do even better *)
fun max_contant3 e =
  let 
    fun max_of_two(e1, e2) = 
      let val m1 = max_contant3 e1
          val m2 = max_contant3 e2
      in if m1 > m2 then m1 else m2 end
  in
    case e of
        Constant i => i
      | Negate e2 => max_contant3 e2
      | Add(e1, e2) => max_of_two(e1, e2)
      | Multiply(e1, e2) => max_of_two(e1, e2)
  end

(* Fourth version. We remove unnesasary val statements *)
fun max_contant4 e =
  let 
    fun max_of_two(e1, e2) = 
      Int.max(max_contant4 e1, max_contant4 e2)
  in
    case e of
        Constant i => i
      | Negate e2 => max_contant4 e2
      | Add(e1, e2) => max_of_two(e1, e2)
      | Multiply(e1, e2) => max_of_two(e1, e2)
  end
