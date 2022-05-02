(* Works only if y >= 0 *)
fun pow(x : int, y : int) = 
  if y = 0
  then 1
  else x * pow(x, y - 1);

fun cube(x : int) = 
  pow(x, 3)

val sixty_four = cube 4
val complex = pow(2, 4) + cube(3) + pow(1, 3)