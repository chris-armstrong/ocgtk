(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SingleSelection *)

type t = Gtk.widget

(** Create a new SingleSelection *)
external new_ : unit -> t = "ml_gtk_single_selection_new"

(* Properties *)

(** Get property: autoselect *)
external get_autoselect : t -> bool = "ml_gtk_single_selection_get_autoselect"

(** Set property: autoselect *)
external set_autoselect : t -> bool -> unit = "ml_gtk_single_selection_set_autoselect"

(** Get property: can-unselect *)
external get_can_unselect : t -> bool = "ml_gtk_single_selection_get_can_unselect"

(** Set property: can-unselect *)
external set_can_unselect : t -> bool -> unit = "ml_gtk_single_selection_set_can_unselect"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_single_selection_get_n_items"

(** Get property: selected *)
external get_selected : t -> int = "ml_gtk_single_selection_get_selected"

(** Set property: selected *)
external set_selected : t -> int -> unit = "ml_gtk_single_selection_set_selected"

