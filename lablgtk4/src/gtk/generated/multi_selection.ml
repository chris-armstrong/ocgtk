(* GENERATED CODE - DO NOT EDIT *)
(* MultiSelection: MultiSelection *)

type t = [`multi_selection | `object_] Gobject.obj

(** Create a new MultiSelection *)
external new_ : unit -> t = "ml_gtk_multi_selection_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_multi_selection_get_n_items"

