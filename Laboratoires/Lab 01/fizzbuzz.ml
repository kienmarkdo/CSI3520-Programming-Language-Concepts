(*  FizzBuzz Program:  Specification modified from:

http://fsharpforfunandprofit.com/posts/railway-oriented-programming-carbonated/

Write a program that prints the numbers from 0 to 100, one per line. 
* For multiples of three print "Fizz" instead of the number.
* For multiples of five print "Buzz". 
* For numbers which are multiples of both three and five print "FizzBuzz".
*)

(* Useful printing functions (what do they do? what type do they have? :

  print_endline
  print_string
  print_newline
  print_int

  Printf works (almost) like in C. Typing printf is a very unusual
  special case hack in OCaml.  An example call:

  Printf.printf "%d" 17   

  Manual with character codes:

  http://caml.inria.fr/pub/docs/manual-ocaml/libref/Printf.html

  Other useful notes:

  e1 mod e2   -- mod operation returns an integer

  e1 = e2     -- equality operation tests equality of two values

  let rec f (x:t) :t = ...    -- remember the "rec" keyword when defining a
                                 recursive function

*)

let print_fizzbuzz (x: int) =
  if (x mod 3 = 0 && x mod 5 = 0) then
    print_endline "Fizzbuzz"
  else if (x mod 3 = 0) then
    print_endline "Fizz"
  else if (x mod 5 = 0) then
    print_endline "Buzz"
  else
    Printf.printf "%d\n" x;;

let rec fizzbuzz (x: int) =
  assert(x >= 0 && x <= 100);
  print_fizzbuzz(x);
  if x < 100 then fizzbuzz(x + 1);;