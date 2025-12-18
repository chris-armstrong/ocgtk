(* GENERATED CODE - DO NOT EDIT *)
(* MultiSorter: MultiSorter *)

type t = [`multi_sorter | `sorter | `object_] Gobject.obj

(** Create a new MultiSorter *)
external new_ : unit -> t = "ml_gtk_multi_sorter_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_multi_sorter_get_n_items"

(** Removes the sorter at the given @position from the list of sorter
used by @self.

If @position is larger than the number of sorters, nothing happens. *)
external remove : t -> int -> unit = "ml_gtk_multi_sorter_remove"

(** Add @sorter to @self to use for sorting at the end.

@self will consult all existing sorters before it will
sort with the given @sorter. *)
external append : t -> Sorter.t -> unit = "ml_gtk_multi_sorter_append"

