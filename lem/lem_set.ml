(*Generated by Lem from set.lem.*)
(******************************************************************************)
(* A library for sets                                                         *)
(*                                                                            *)
(* It mainly follows the Haskell Set-library                                  *)
(******************************************************************************)

(* Sets in Lem are a bit tricky. On the one hand, we want efficiently executable sets.
   OCaml and Haskell both represent sets by some kind of balancing trees. This means
   that sets are finite and an order on the element type is required. 
   Such sets are constructed by simple, executable operations like inserting or
   deleting elements, union, intersection, filtering etc.

   On the other hand, we want to use sets for specifications. This leads often
   infinite sets, which are specificied in complicated, perhaps even undecidable
   ways.

   The set library in this file, chooses the first approach. It describes 
   *finite* sets with an underlying order. Infinite sets should in the medium
   run be represented by a separate type. Since this would require some significant
   changes to Lem, for the moment also infinite sets are represented using this
   class. However, a run-time exception might occour when using these sets. 
   This problem needs adressing in the future. *)
   

(* ========================================================================== *)
(* Header                                                                     *)
(* ========================================================================== *)

open Lem_bool
open Lem_basic_classes
open Lem_maybe
open Lem_function
open Lem_num
open Lem_list
open Lem_set_helpers

(* ----------------------- *)
(* Equality check          *)
(* ----------------------- *)

(*val setEqualBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> bool*)

(*val setEqual : forall 'a. SetType 'a => set 'a -> set 'a -> bool*)

let instance_Basic_classes_Eq_set_dict dict_Basic_classes_SetType_a:('a Pset.set)eq_class= ({

  isEqual_method = Pset.equal;

  isInequal_method = (fun s1 s2->not (Pset.equal s1 s2))})



(* ----------------------- *)
(* compare                 *)
(* ----------------------- *)

(*val setCompareBy: forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> ordering*)

(*val setCompare : forall 'a. SetType 'a => set 'a -> set 'a -> ordering*)

let instance_Basic_classes_SetType_set_dict dict_Basic_classes_SetType_a:('a Pset.set)setType_class= ({

  setElemCompare_method = Pset.compare})


(* ----------------------- *)
(* Empty set               *)
(* ----------------------- *)

(*val empty : forall 'a. SetType 'a => set 'a*) 
(*val emptyBy : forall 'a. ('a -> 'a -> ordering) -> set 'a*)

(* ----------------------- *)
(* any / all               *)
(* ----------------------- *)

(*val any : forall 'a. SetType 'a => ('a -> bool) -> set 'a -> bool*)

(*val all : forall 'a. SetType 'a => ('a -> bool) -> set 'a -> bool*)


(* ----------------------- *)
(* (IN)                    *)
(* ----------------------- *)

(*val IN [member] : forall 'a. SetType 'a => 'a -> set 'a -> bool*) 
(*val memberBy : forall 'a. ('a -> 'a -> ordering) -> 'a -> set 'a -> bool*)

(* ----------------------- *)
(* not (IN)                *)
(* ----------------------- *)

(*val NIN [notMember] : forall 'a. SetType 'a => 'a -> set 'a -> bool*)



(* ----------------------- *)
(* Emptyness check         *)
(* ----------------------- *)

(*val null : forall 'a. SetType 'a => set 'a -> bool*)


(* ------------------------ *)
(* singleton                *)
(* ------------------------ *)

(*val singleton : forall 'a. SetType 'a => 'a -> set 'a*)


(* ----------------------- *)
(* size                    *)
(* ----------------------- *)

(*val size : forall 'a. SetType 'a => set 'a -> nat*)


(* ----------------------------*)
(* setting up pattern matching *)
(* --------------------------- *)

(*val set_case : forall 'a 'b. SetType 'a => set 'a -> 'b -> ('a -> 'b) -> 'b -> 'b*)


(* ------------------------ *)
(* union                    *)
(* ------------------------ *)

(*val unionBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> set 'a*)
(*val union : forall 'a. SetType 'a => set 'a -> set 'a -> set 'a*)

(* ----------------------- *)
(* insert                  *)
(* ----------------------- *)

(*val insert : forall 'a. SetType 'a => 'a -> set 'a -> set 'a*)

(* ----------------------- *)
(* filter                  *)
(* ----------------------- *)

(*val filter : forall 'a. SetType 'a => ('a -> bool) -> set 'a -> set 'a*) 
(*let filter P s:set 'a=  {e | forall (e IN s) | P e}*)


(* ----------------------- *)
(* partition               *)
(* ----------------------- *)

(*val partition : forall 'a. SetType 'a => ('a -> bool) -> set 'a -> set 'a * set 'a*)
let partition dict_Basic_classes_SetType_a p0 s:'a Pset.set*'a Pset.set=  (Pset.filter p0 s, Pset.filter (fun e -> not (p0 e)) s)


(* ----------------------- *)
(* split                   *)
(* ----------------------- *)

(*val split : forall 'a. SetType 'a, Ord 'a => 'a -> set 'a -> set 'a * set 'a*)
let split dict_Basic_classes_SetType_a dict_Basic_classes_Ord_a p s:'a Pset.set*'a Pset.set=  (Pset.filter (
  dict_Basic_classes_Ord_a.isGreater_method p) s, Pset.filter (dict_Basic_classes_Ord_a.isLess_method p) s)

(*val splitMember : forall 'a. SetType 'a, Ord 'a => 'a -> set 'a -> set 'a * bool * set 'a*)
let splitMember dict_Basic_classes_SetType_a dict_Basic_classes_Ord_a p s:'a Pset.set*bool*'a Pset.set=  (Pset.filter (
  dict_Basic_classes_Ord_a.isLess_method p) s,  Pset.mem p s, Pset.filter (
  dict_Basic_classes_Ord_a.isGreater_method p) s)

(* ------------------------ *)
(* subset and proper subset *)
(* ------------------------ *)

(*val isSubsetOfBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> bool*)
(*val isProperSubsetOfBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> bool*)

(*val isSubsetOf : forall 'a. SetType 'a => set 'a -> set 'a -> bool*)
(*val isProperSubsetOf : forall 'a. SetType 'a => set 'a -> set 'a -> bool*)


(* ------------------------ *)
(* delete                   *)
(* ------------------------ *)

(*val delete : forall 'a. SetType 'a, Eq 'a => 'a -> set 'a -> set 'a*)
(*val deleteBy : forall 'a. SetType 'a => ('a -> 'a -> bool) -> 'a -> set 'a -> set 'a*)


(* ------------------------ *)
(* bigunion                 *)
(* ------------------------ *)

(*val bigunion : forall 'a. SetType 'a => set (set 'a) -> set 'a*)
(*val bigunionBy : forall 'a. ('a -> 'a -> ordering) -> set (set 'a) -> set 'a*)

(*let bigunion bs:set 'a=  {x | forall (s IN bs) (x IN s) | true}*)

(* ------------------------ *)
(* big intersection         *)
(* ------------------------ *)

(* Shaked's addition, for which he is now forever responsible as a de facto
 * Lem maintainer...
 *)
(*val bigintersection : forall 'a. SetType 'a => set (set 'a) -> set 'a*)
let bigintersection dict_Basic_classes_SetType_a bs:'a Pset.set=  (let x2 =(Pset.from_list  
  dict_Basic_classes_SetType_a.setElemCompare_method  []) in  Pset.fold
   (fun x x2 ->
    if Pset.for_all (fun s -> Pset.mem x s) bs then Pset.add x x2 else x2)
   ((Pset.bigunion dict_Basic_classes_SetType_a.setElemCompare_method bs)) 
 x2)

(* ------------------------ *)
(* difference               *)
(* ------------------------ *)

(*val differenceBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> set 'a*)
(*val difference : forall 'a. SetType 'a => set 'a -> set 'a -> set 'a*)

(* ------------------------ *)
(* intersection             *)
(* ------------------------ *)

(*val intersection : forall 'a. SetType 'a => set 'a -> set 'a -> set 'a*)
(*val intersectionBy : forall 'a. ('a -> 'a -> ordering) -> set 'a -> set 'a -> set 'a*)


(* ------------------------ *)
(* map                      *)
(* ------------------------ *)

(*val map : forall 'a 'b. SetType 'a, SetType 'b => ('a -> 'b) -> set 'a -> set 'b*) (* before image *)
(*let map f s:set 'b=  { f e | forall (e IN s) | true }*)

(*val mapBy : forall 'a 'b. ('b -> 'b -> ordering) -> ('a -> 'b) -> set 'a -> set 'b*) 


(* ------------------------ *)
(* bigunionMap              *)
(* ------------------------ *)

(* In order to avoid providing an comparison function for sets of sets,
   it might be better to combine bigunion and map sometimes into a single operation. *)

(*val bigunionMap : forall 'a 'b. SetType 'a, SetType 'b => ('a -> set 'b) -> set 'a -> set 'b*)
(*val bigunionMapBy : forall 'a 'b. ('b -> 'b -> ordering) -> ('a -> set 'b) -> set 'a -> set 'b*)

(* ------------------------ *)
(* mapMaybe and fromMaybe   *)
(* ------------------------ *)

(* If the mapping function returns Just x, x is added to the result
   set. If it returns Nothing, no element is added. *)

(*val mapMaybe : forall 'a 'b. SetType 'a, SetType 'b => ('a -> maybe 'b) -> set 'a -> set 'b*)
let setMapMaybe dict_Basic_classes_SetType_a dict_Basic_classes_SetType_b f s:'b Pset.set=   
 (Pset.map_union  dict_Basic_classes_SetType_b.setElemCompare_method (fun x -> (match f x with 
                        | Some y  ->(Pset.from_list  
  dict_Basic_classes_SetType_b.setElemCompare_method [y]) 
                        | None -> (Pset.empty  
  dict_Basic_classes_SetType_b.setElemCompare_method)
                        ))
              s)

(*val removeMaybe : forall 'a. SetType 'a => set (maybe 'a) -> set 'a*)
let removeMaybe dict_Basic_classes_SetType_a s:'a Pset.set=  (setMapMaybe 
  (instance_Basic_classes_SetType_Maybe_maybe_dict
     dict_Basic_classes_SetType_a) dict_Basic_classes_SetType_a (fun x -> x) s)

(* ------------------------ *)
(* min and max              *)
(* ------------------------ *)

(*val findMin : forall 'a.  SetType 'a, Eq 'a => set 'a -> maybe 'a*) 
(*val findMax : forall 'a.  SetType 'a, Eq 'a => set 'a -> maybe 'a*)

(* ------------------------ *)
(* fromList                 *)
(* ------------------------ *)

(*val fromList : forall 'a.  SetType 'a => list 'a -> set 'a*) (* before from_list *)
(*val fromListBy : forall 'a.  ('a -> 'a -> ordering) -> list 'a -> set 'a*) 


(* ------------------------ *)
(* Sigma                    *)
(* ------------------------ *)

(*val sigma : forall 'a 'b. SetType 'a, SetType 'b => set 'a -> ('a -> set 'b) -> set ('a * 'b)*)
(*val sigmaBy : forall 'a 'b. (('a * 'b) -> ('a * 'b) -> ordering) -> set 'a -> ('a -> set 'b) -> set ('a * 'b)*)

(*let sigma sa sb:set('a*'b)=  { (a, b) | forall (a IN sa) (b IN sb a) | true }*)


(* ------------------------ *)
(* cross product            *)
(* ------------------------ *)

(*val cross : forall 'a 'b. SetType 'a, SetType 'b => set 'a -> set 'b -> set ('a * 'b)*)
(*val crossBy : forall 'a 'b. (('a * 'b) -> ('a * 'b) -> ordering) -> set 'a -> set 'b -> set ('a * 'b)*)

(*let cross s1 s2:set('a*'b)=  { (e1, e2) | forall (e1 IN s1) (e2 IN s2) | true }*)


(* ------------------------ *)
(* finite                   *)
(* ------------------------ *)

(*val finite : forall 'a. SetType 'a => set 'a -> bool*)


(* ----------------------------*)
(* fixed point                 *)
(* --------------------------- *)

(*val leastFixedPoint : forall 'a. SetType 'a 
  => nat -> (set 'a -> set 'a) -> set 'a -> set 'a*)
let rec leastFixedPoint dict_Basic_classes_SetType_a bound f x:'a Pset.set= 
  (
  if(bound =  0) then x else
    (let bound'0 =(Nat_num.nat_monus bound ( 1)) in
     let fx = (f x) in
     if Pset.subset fx x then x else
       leastFixedPoint dict_Basic_classes_SetType_a bound'0 f
         ( Pset.(union) fx x))) 
