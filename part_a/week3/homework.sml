(* Dan Grossman, Coursera PL, HW2 Provided Code *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2
(* Solution to problem one *)
fun all_except_option(to_filter, lst) = 
    case lst of
    [] => NONE
    | x::xs => if same_string(x, to_filter) 
                  then SOME xs
                  else case all_except_option(to_filter, xs) of
                       NONE => NONE
                     | SOME xs => SOME(x :: xs)
                
fun get_substitutions1(xs, to_filter) = 
    case xs of 
        [] => []
        | x::xs' => case all_except_option(to_filter, x) of
                        NONE => []
                        |SOME sublist => sublist @ get_substitutions1(xs', to_filter)


fun get_substitutions2(xs, to_filter) = 
    let
        fun get_list_option(opt) = 
            case opt of
                NONE => []
                | SOME res => res
        fun helper(xs, acc) = 
            case xs of
              [] => acc
            | x::xs' => let val curr = get_list_option(all_except_option(to_filter, x)) in  helper(xs', curr @ acc) end
    in
        helper(xs, [])
    end

val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test1 = all_except_option ("string", ["string"]) = SOME []

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]




(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color (card) =
  case card of
      {1=Clubs,  2=_} => Black    
    | {1=Spades, 2=_} => Black
    | _ => Red



fun card_value (card) =
  case card of
      {1=_ , 2=Num(int)} => int
    | {1=_ , 2=Ace} => 11
    | _ => 10


(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test5 = card_color (Clubs, Num 2) = Black

val test6 = card_value (Clubs, Num 2) = 2

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
