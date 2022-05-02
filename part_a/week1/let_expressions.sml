fun something(z: int) = 
    let
        val x = if z  > 0 then z else 34
        val y = z + 5
    in 
        if x > y then x * 2 else y * y
    end

fun silly() = 
    let
        val x = (let val x = 5 in x + 10 end)
    in
        (x, let val x = 2 in x end, let val x = 10 in let val x = 2 in x end end)
    end



(* With helper functions *)
fun count(from: int, to: int) = 
    if from = to
    then to :: []
    else from :: count(from + 1, to)

fun count_from_one(x: int) = 
    count(1, x)

(* Using Nested functions *)
fun count_from_one_nested(x: int) = 
    let 
        fun count(from: int) = 
            if from = x
            then x :: []
            else from :: count(from + 1)
    in
        count(1)
    end

val count_from_one_to_100 = count_from_one_nested 100



(* Option *)
fun max(xs: int list) = 
    if null xs
    then NONE
    else
        let val t1_ans = max(tl xs)
        in if isSome t1_ans andalso valOf t1_ans > hd xs
        then t1_ans
        else SOME(hd xs)
    end
