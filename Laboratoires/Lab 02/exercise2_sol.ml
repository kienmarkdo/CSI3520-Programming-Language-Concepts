(*

  Plan:
   * tuples et listes
   * options

*)

(* Un employé est un tuple de nom, d'âge et de booléen indiquant le statut de mariage *)
type employee = string * int * bool

(* 1. Écrivez une fonction qui prend un employé et imprime les informations sous une forme lisible. *)
let print_employee_info (t:employee) : unit =
  match t with
  | (name,age,married) ->
     print_string ("\nEmployee Name: " ^ name ^ "\n");
     print_string ("Employee Age: " ^ string_of_int age ^ "\n");
     print_string name;
     (match married with
      | true -> print_string " is "
      | false -> print_string " is not ");
     print_string "married\n\n"

(* 2. Réimplémentez les fonctions standard OCaml List.length et List.rev *)

let rec length (l:int list) : int =
  match l with
  | [] -> 0
  | h::t -> 1 + length t

let rec rev (l:int list) : int list =
  match l with
  | [] -> []
  | h::t -> rev t @ [h]

(* 3. Supprimez le k ième élément d'une liste. Supposons l'indexation à partir de 0 *)
(* exemple : rmk 2 ["to" ; "be" ; "or" ; "not" ; "to" ; "be"]
 * résultats : [["to" ; "be" ; "not" ; "to" ; "be"] *)

let rec rmk (k:int) (l:string list) : string list =
  match k with
    0 -> (match l with
          | [] -> []
          | h::t -> t)
  | n -> (match l with
          | [] -> []
          | h::t -> h::rmk (n - 1) t)

(* 4. Écrivez une fonction qui renvoie la plus petite des deux arguments de type "int option",
 * ou None si les deux sont None. Si exactement un argument est None, renvoyez l'autre. Faire
 * le même pour la plus grande des deux options int.*)

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

(* 5. Écrivez une fonction qui renvoie l'entier enterré dans l'argument
 * ou None autrement *)

let get_option (x: int option option option option) : int option =
   match x with
   | Some (Some (Some (Some v) ) ) -> (Some v)
   | _ -> None

(* 6. Écrivez une fonction qui renvoie le booléen AND / OR de deux options bool,
 * ou None si les deux sont None. Si exactement l'un est None, renvoyez l'autre. *)

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

(* 7. Écrivez une fonction qui retourne l'élément final d'une liste,
   s'il existe, et None autrement*)

let rec final (l: int list) : int option =
  match l with
    | [] -> None
    | h::[] -> Some h
    | h1::h2::t -> final (h2::t)

(* 8. Facultatif (mais important pour la préparation du labo de la semaine prochaine):
  * Ecrire une fonction d'ordre supérieur pour les opérations binaires sur les options.
  * Si les deux arguments sont présents, appliquez l'opération.
  * Si les deux arguments sont None, renvoie None. Si un argument est (Some x)
  * et l'autre argument est None, la fonction doit retourner (Some x) *)
(* Quel est le type de la fonction calc_option? *)

let calc_option (f: 'a->'a->'a) (x: 'a option) (y: 'a option) : 'a option =
  match x with
  | Some a -> (match y with
               | Some b -> Some (f a b)
               | None -> x)
  | None -> y

(* 9. Facultatif (mais important pour la semaine prochaine):
  * Réécrivez les fonctions suivantes en utilisant la fonction d'ordre supérieur ci-dessus
  * Ecrire une fonction pour renvoyer la plus petite des deux "int options", ou None
  * si les deux sont None. Si exactement un argument est None, renvoyez l'autre.
  * Faites de même pour la plus grande des deux "int options". *)

let min (a:int) (b:int) : int = if a < b then a else b
let max (a:int) (b:int) : int = if a < b then b else a

let min_option2 (x: int option) (y: int option) : int option =
  calc_option min x y

let max_option2 (x: int option) (y: int option) : int option =
  calc_option max x y

