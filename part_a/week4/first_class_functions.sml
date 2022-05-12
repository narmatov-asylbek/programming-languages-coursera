fun double x = x * 2
fun inc x = x + 1

val a_tuple = (double, inc, double(inc (5)))
val eighteen = (#1 a_tuple) 9

fun increment_n_times_lame(n, x) = 
    if n = 0
    then x
    else 1 + increment_n_times_lame(n - 1, x)

fun double_n_times_lame(n, x) = 
    if n = 0
    then x
    else 2 * double_n_times_lame(n - 1, x)

fun nth_tail_lame(n, xs) = 
    if n = 0
    then xs
    else tl (nth_tail_lame (n - 1, xs))

fun n_times(f, n, x) = 
    if n = 0
    then x
    else f (n_times(f, n - 1, x))

fun increment x = x + 1
fun double x = x + x

val x1 = n_times(double, 4, 7)
val x2 = n_times(increment, 6, 10)
val x3 = n_times(tl, 2, [4, 6, 7, 8])