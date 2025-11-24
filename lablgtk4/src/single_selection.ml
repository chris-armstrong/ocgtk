(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SingleSelection *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_single_selection_new"

(* Properties *)

external get_autoselect : t -> bool = "ml_gtk_single_selection_get_autoselect"

external set_autoselect : t -> bool -> unit = "ml_gtk_single_selection_set_autoselect"

external get_can_unselect : t -> bool = "ml_gtk_single_selection_get_can_unselect"

external set_can_unselect : t -> bool -> unit = "ml_gtk_single_selection_set_can_unselect"

external get_n_items : t -> int = "ml_gtk_single_selection_get_n_items"

external get_selected : t -> int = "ml_gtk_single_selection_get_selected"

external set_selected : t -> int -> unit = "ml_gtk_single_selection_set_selected"

