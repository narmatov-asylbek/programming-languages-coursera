fun swap(pr : int * bool) = 
    (#2 pr, #1 pr)

fun some_of_pairs(pr1: int * int, pr2: int * int) = 
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)
