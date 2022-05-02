(*This is a comment*)

val x = 34;
(* Static environment: x --> int *)
(* Dynamic environemt: x --> 34 *)

val y = 37;
(* Static environment: x --> int; y --> int *)
(* Dynamic environemt: x --> 34; y --> 37 *)

val z = (x + y) + (y + 2);
(* Static environment: x --> int; y --> int; z --> int *)
(* Dynamic environemt: x --> 34; y --> 37; z --> 110 *)

val abs_of_z = if z < 0 then 0 -z else z;
(* Static environment: x --> int; y --> int; z --> int; abs_of_z --> int *)
(* Dynamic environemt: x --> 34; y --> 37; z --> 110; abs_of_z --> 110 *)