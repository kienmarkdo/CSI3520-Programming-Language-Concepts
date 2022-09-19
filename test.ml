(** These are how you write comments in OCaml *)
(** Intro stuff. Messing around with OCaml. *)

let multiply_int x y = x * y;;

let rec fib_int x = if x < 3 then 1 else fib_int(x - 1) + fib_int(x - 2);;

let increment_float x = x +. 1.0;;

let add_float (x: float) (y: float): float = 
  x +. y;;