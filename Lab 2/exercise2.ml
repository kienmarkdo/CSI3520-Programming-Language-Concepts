(*

  Plan:
   * tuples et listes
   * options
   * fonctions d'ordre supérieur

  Notez que les questions 2, 8 et 9 sont facultatives.

*)

(* Un employé est un tuple de nom, d'âge et de booléen indiquant le statut de mariage *)
type employee = string * int * bool

(* 1. Écrivez une fonction qui prend un employé et imprime les informations sous une forme lisible. *)

(*
let print_employee_info t =
*)

(* 2. Réimplémentez les fonctions standard OCaml List.length et List.rev
   Cette question est facultative, mais est une bonne pratique. *)

(*
let length (l:'a list) : int =

let rev (l:'a list) : 'a list =
*)

(* 3. Supprimez le k ième élément d'une liste. Supposons l'indexation à partir de 0 *)
(* exemple : rmk 2 ["to" ; "be" ; "or" ; "not" ; "to" ; "be"]
 * résultats : [["to" ; "be" ; "not" ; "to" ; "be"] *)
(* let rmk (k:int) (l:string list) : string list =  *)


(* 4. Écrivez une fonction qui renvoie la plus petite des deux arguments de type "int option",
 * ou None si les deux sont None. Si exactement un argument est None, renvoyez l'autre. Faire
 * le même pour la plus grande des deux "int options".*)

(*
let min_option (x: int option) (y: int option) : int option =
*)

(*
let max_option (x: int option) (y: int option) : int option =
*)

(* 5. Écrivez une fonction qui renvoie l'entier enterré dans l'argument
 * ou None autrement *)

(*
let get_option (x: int option option option option) : int option =
*)

(* 6. Écrivez une fonction qui renvoie le booléen AND / OR de deux options bool,
 * ou None si les deux sont None. Si exactement l'un est None, renvoyez l'autre. *)

(*
let and_option (x:bool option) (y: bool option) : bool option =
*)

(*
let or_option (x:bool option) (y: bool option) : bool option =
*)

(* Quel est le motif? Comment pouvons-nous éliminer un code similaire? *)

(* 7. Écrivez une fonction qui retourne l'élément final d'une liste,
   s'il existe, et None autrement*)
(*
let final (l: int list) : int option =
*)


(* 8. Facultatif (mais important pour la préparation du labo de la semaine prochaine):
  * Ecrire une fonction d'ordre supérieur pour les opérations binaires sur les options.
  * Si les deux arguments sont présents, appliquez l'opération.
  * Si les deux arguments sont None, renvoie None. Si un argument est (Some x)
  * et l'autre argument est None, la fonction doit retourner (Some x) *)
(* Quel est le type de la fonction calc_option? *)

(*
let calc_option (f: 'a->'a->'a) (x: 'a option) (y: 'a option) : 'a option =
*)

(* 9. Facultatif (mais important pour la semaine prochaine):
  * Réécrivez les fonctions suivantes en utilisant la fonction d'ordre supérieur ci-dessus
  * Ecrire une fonction pour renvoyer la plus petite des deux "int options", ou None
  * si les deux sont None. Si exactement un argument est None, renvoyez l'autre.
  * Faites de même pour la plus grande des deux "int options". *)

(*
let min_option2 (x: int option) (y: int option) : int option =
*)

(*
let max_option2 (x: int option) (y: int option) : int option =
*)
