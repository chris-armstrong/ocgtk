(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MultiSorter *)

type t = Gtk.widget

(** Create a new MultiSorter *)
external new_ : unit -> t = "ml_gtk_multi_sorter_new"

(* Properties *)

(** Removes the sorter at the given @position from the list of sorter
used by @self.

If @position is larger than the number of sorters, nothing happens. *)
external remove : t -> int -> unit = "ml_gtk_multi_sorter_remove"

(** Add @sorter to @self to use for sorting at the end.

@self will consult all existing sorters before it will
sort with the given @sorter. *)
external append : t -> Gtk.widget -> unit = "ml_gtk_multi_sorter_append"

