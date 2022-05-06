fun custom_head lst = 
    case lst of
      [] => raise List.Empty
    | x :: _ => x


exception SomeException
exception OtherException of int * int

fun mydiv (x, y) = 
    if y = 0 
    then raise OtherException(x, y)
    else x div y
