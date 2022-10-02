(* Objectif: 
   - le polymorphisme
   - plus de pratique sur la récursivité, les fonctions d'ordre supérieur et les options *)


(**************)
(* PROBLÈME 1 *)
(**************)
(* Les fonctions ci-dessous sont des solutions possibles aux
   questions 4 et 6 du laboratoire 2. Quel est le modèle? Comment
   pouvons-nous factoriser un code similaire? Votre tâche consiste à
   factoriser le code commun en implémentant une fonction d'ordre
   supérieur pour les opérations binaires sur les options telle que:
 * Si les deux arguments sont présents, appliquez l'opération.
 * Si les deux arguments sont None, renvoyez None.
 * Si un argument est (Some x) et l'autre argument est None,
   la fonction devrait renvoyer (Some x) *)

let min_option (x: int option) (y: int option) : int option = 
  match x with
  | Some a -> (match y with
               | Some b -> if a < b then x else y
               | None -> x)
  | None -> y

let max_option (x: int option) (y: int option) : int option = 
  match x with
  | Some a -> (match y with
               | Some b -> if a < b then y else x
               | None -> x)
  | None -> y

let and_option (x:bool option) (y: bool option) : bool option = 
  match x with
  | Some a -> (match y with
               | Some b -> if a then y else Some false
               | None -> x)
  | None -> y
           
let or_option (x:bool option) (y: bool option) : bool option = 
  match x with
  | Some a -> (match y with
               | Some b -> if a then Some true else y
               | None -> x)
  | None -> y

let calc_option (f: 'a->'a->'a) (x: 'a option) (y: 'a option) : 'a option =  
   match x with
   |Some a -> (match y with
               | Some b -> Some (f a b)
               | None -> x)
   |None -> y

(**************)
(* PROBLÈME 2 *)
(**************)
(* Maintenant, réécrivez les fonctions suivantes en utilisant la
   fonction calc_option ci-dessus. *)

(*
let min_option2 (x: int option) (y: int option) : int option = 

let max_option2 (x: int option) (y: int option) : int option = 

let and_option2 (x:bool option) (y: bool option) : bool option = 

let or_option2 (x:bool option) (y: bool option) : bool option = 
*)

let min_option2 (x: int option) (y: int option) : int option = calc_option (min) x y;;

let max_option2 (x: int option) (y: int option) : int option = calc_option (max) x y;;

let and_option2 (x:bool option) (y: bool option) : bool option = calc_option (&&) (x) (y);;
 
let or_option2 (x:bool option) (y: bool option) : bool option = calc_option (||) (x) (y);;

(**
Test runs:

utop # min_option (Some 3) (Some 5);;
- : int option = Some 3

utop # min_option2 (Some 3) (Some 5);;
- : int option = Some 3

utop # max_option2 (Some 3) (Some 5);;
- : int option = Some 5
*)


(**************)
(* PROBLÈME 3 *)
(**************)
(* Problème 3a. Implementez une fonction qui prend une liste de
   valeurs booléennes [x1; x2; ...; xn] et renvoie
   x1 AND x2 AND ... AND xn.
   Supposez que la valeur de (and_list []) soit TRUE. *)

(*
let rec and_list (lst: bool list) : bool =
 *)

let rec and_list (lst: bool list) : bool =
   match lst with
      | [] -> true
      | h :: t -> if h = false then false else and_list (t);;

(* Problème 3b. Faites la même chose que ci-dessus pour OR.
   Supposez que la valeur de (or_list []) soit FALSE. *)

(* 
let rec or_list (lst: bool list) : bool = 
 *)

let rec or_list (lst: bool list) : bool =
   match lst with
      | [] -> false
      | h :: t -> if h = true then true else or_list (t);;

(**************)
(* PROBLÈME 4 *)
(**************)
(* Ecrivez une fonction récursive qui renvoie le maximum d'une liste
   d'entiers et qui renvoie None si la liste est vide. Vous pouvez
   utiliser max_option ou max_option2 ci-dessus, mais ce n'est pas
   obligatoire. *)

(*
let rec max_of_list (lst:int list) : int option =
 *)
let rec max_of_list (lst:int list) : int option =
   match lst with
      | [] -> None
      | h :: t -> max_option2 (Some h) (max_of_list t);;


(**************)
(* PROBLÈME 5 *)
(**************)
(* Dans les exercices suivants, nous utiliserons "map" (comme nous
   l'avons vu en classe) pour implémenter certaines fonctions. *)

let rec map (f:'a -> 'b) (xs: 'a list) : 'b list =
  match xs with
  | [] -> []
  | hd::tl -> (f hd) :: (map f tl)

(* Problème 5a. Ecrivez une fonction qui prend comme argument une
   liste d’entiers et qui multiplie chaque entier par 3. Utilisez
   "map". *)
(*
let times_3 (lst: int list): int list = 
 *)

let times_3 (lst: int list): int list = 
   List.map (fun x -> x * 3) lst;;

(* Problème 5b. Ecrivez une fonction qui prend comme arguments une
   liste d’entiers et un entier et qui multiplie chaque élément de la
   liste par l’entier. Utilisez "map". *)
(* let times_x (x: int) (lst: int list) : int list =
 *)

let times_x (x: int) (lst: int list): int list = 
   List.map (fun y -> y * x) lst;;

(* Problème 5c. Réécrivez times_3 en utilisant times_x. Cela devrait
   nécessiter très peu de code. *)
(*            
let times_3_shorter =
 *)

let times_3_shorter (lst: int list) = times_x 3 lst;;


(**************)
(* PROBLÈME 6 *)
(**************)
(* Considérez la fonction d'ordre supérieur suivante appelée
   "reduce". *)

let rec reduce (f:'a -> 'b -> 'b) (u:'b) (xs:'a list) : 'b =
  match xs with
  | [] -> u
  | hd::tl -> f hd (reduce f u tl);;

(* Considérez les fonctions suivantes définies en utilisant "reduce" *)

let sum xs = reduce (fun x y -> x+y) 0 xs
let prod xs = reduce (fun x y -> x*y) 1 xs

(* Que font les fonctions "sum" et "prod"? Que fait la fonction
   "reduce"?  Tracez le code suivant pour vous aider à
   comprendre. Montrez votre trace et donnez votre explication ici:

RÉPONSE ICI

 *)

let mysum = sum [2;5;6]
let myprod = prod [2;5;6]


