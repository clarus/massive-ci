Require Import OCaml.OCaml.

Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Definition head {A : Type} (l : list A) : M [ OCaml.Failure ] A :=
  match l with
  | [] => OCaml.Pervasives.failwith "empty list" % string
  | cons x _ => ret x
  end.
