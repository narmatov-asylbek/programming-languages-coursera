val empty = []
val x = [3, 4, 5]
val bool_list = [true, false]
val hello = [5]::[]
val tail = tl x

fun sum_list(xs: int list) = 
    if null xs 
    then 0 
    else hd xs + sum_list(tl xs)

val result = sum_list x

fun list_product(xs: int list) = 
    if null xs
    then 1
    else hd xs * list_product(tl xs)

val test_1 = list_product []
val test2 = list_product [5]
val test_3 = list_product [2, 4, 2]


fun countdown(x : int) = 
    if x = 0
    then []
    else x :: countdown (x - 1)


val test1 = countdown 7

fun append(xs: int list, ys: int list) = 
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)

fun sum_pair_list(xs: (int * int) list) = 
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

fun firsts(xs: (int * int) list) = 
    if null xs
    then []
    else (#1 (hd xs)) :: firsts(tl xs)