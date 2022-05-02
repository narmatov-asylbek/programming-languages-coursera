(* Helper Functions *)
fun in_month(date: int * int * int, month: int) = 
    if (#2 date) = month
    then true
    else false

fun compare(date: int * int * int, month: int) = 
    if in_month(date, month)
    then 1
    else 0

(* Main functions *)
fun is_older(date1: int*int*int, date2: int*int*int) =
    if #1 date1 < #1 date2
    then true
    else if #1 date1 > #1 date2
    then false
    else if #2 date1 < #2 date2
    then true
    else if #2 date1 > #2 date2
    then false
    else if #3 date1 < #3 date2
    then true
    else false

fun number_in_month(dates: (int * int * int) list, month: int) = 
    if null dates
    then 0
    else compare(hd dates, month) + number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) = 
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) = 
    if null dates
    then []
    else if in_month(hd dates, month) then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list) = 
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings: string list, n: int) = 
    if n <= 1
    then hd strings
    else get_nth(tl strings, n - 1)

fun date_to_string(date: int * int * int) = 
    let
        val months = [
            "January",  "February", "March", "April",
            "May", "June", "July", "August", 
            "September", "October", "November", "December"
        ]
    in
        get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
    end

fun number_before_reaching_sum(sum: int, list_numbers: int list) =
    if sum - hd list_numbers > 0
    then 1 + number_before_reaching_sum(sum - hd list_numbers, tl list_numbers)
    else 0

fun what_month(day: int) =
    let val list_days_months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(day, list_days_months) + 1
    end

fun month_range(day1: int, day2: int) = 
    if day1 > day2
    then []
    else what_month day1 :: month_range(day1 + 1, day2)


fun oldest(days: (int * int * int) list) = 
    if null days
    then NONE
    else if null (tl days)
    then SOME(hd days)
    else
        let val val_ans = oldest(tl days)
        in
            if isSome val_ans andalso is_older(hd days, valOf val_ans)
            then SOME(hd days)
            else val_ans
    end
