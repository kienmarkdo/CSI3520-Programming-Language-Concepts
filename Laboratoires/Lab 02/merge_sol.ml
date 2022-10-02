(* Implémentez et testez "mergesort". Assurez-vous de comprendre le code
   qui est donné et remplissez tout le code manquant marqué par "TODO" *)

(* Divisez xs en deux parties paires: ys and zs *)
let rec split (xs:int list) (ys:int list) (zs: int list) : int list * int list =
  match xs with
      [] -> (ys, zs)
    | hd :: tail -> split tail zs (hd :: ys)

(* Expliquez brièvement l'algorithme utilisé par la fonction ci-dessus. 
  Comment se divise-t-il xs en deux parties égales? *)
let split_alg : string =
 "Dans chaque appel récursif, les deuxième et troisième arguments \
 sont inversés, tel que l'élément suivant dans xs soit ajouté au \
 début d'une des deux listes.  Lors du prochain appel l'élément \
 suivant dans xs est ajouté à l'autre liste, et ainsi de suite. \
 Dans le résultat final, soit les listes ont la même longueur, \
 soit une liste a un élément de plus que l'autre."

(* Fusionnez deux listes xs et ys *)
(* deux listes vides fusionnent en une liste vide *)
(* une liste vide fusionne avec une liste non vide donnant le dernier, inchangé *)
(* deux listes non vides : comparent les premiers éléments et ajoutent le plus petit
 * des deux au résultat de l'appel récursif *)
let rec merge (xs:int list) (ys:int list) : int list =
  match (xs, ys) with
      ([], []) -> [] 
    | (_, []) -> xs 
    | ([], _) -> ys
    | (xhd :: xtail, yhd :: ytail) -> 
      if (xhd <= yhd) then
	xhd :: (merge xtail ys)
      else
	yhd :: (merge xs ytail)

(* Triez la liste os *)
(* une liste vide est déjà triée *)
(* une liste qui contient un élément est déjà triée *)
(* une liste multi-éléments doit être divisée
 * et triés récursivement, puis fusionné *)
let rec mergesort (os:int list) : int list  =
  match os with
      [] -> []
    | [hd] -> [hd]
    | _ ->
      let (ls, rs) = split os [] [] in
      merge (mergesort ls) (mergesort rs)

let int_data1 : int list = []
let int_data2 : int list = [5]
let int_data3 : int list = [3; 5]
let int_data4 : int list = [5; 3]
let int_data5 : int list = [5; 7; 4; 3; 2; 1; 6]

let test1 () = mergesort int_data1 = []
let test2 () = mergesort int_data2 = [5]
let test3 () = mergesort int_data3 = [3; 5]
let test4 () = mergesort int_data4 = [3; 5]
let test5 () = mergesort int_data5 = [1; 2; 3; 4; 5; 6; 7]

let tests = [test1; test2; test2; test3; test4; test5]

let rec runtests (tests : (unit -> bool) list) =
  match tests with
      [] -> ()
    | hd::tail -> 
      if hd () 
      then print_endline "success!" 
      else print_endline "failure :-(";
      runtests tail

let main = 
  print_string "\n\nBeginning Tests\n\n"; 
  runtests tests;
  print_string "\nCompleted Tests\n\n"; 
