(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SortListModel *)

type t = Gtk.Widget.t

(** Create a new SortListModel *)
external new_ : unit -> Gtk.Widget.t option -> t = "ml_gtk_sort_list_model_new"

(* Properties *)

(** Get property: incremental *)
external get_incremental : t -> bool = "ml_gtk_sort_list_model_get_incremental"

(** Set property: incremental *)
external set_incremental : t -> bool -> unit = "ml_gtk_sort_list_model_set_incremental"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_sort_list_model_get_n_items"

(** Get property: pending *)
external get_pending : t -> int = "ml_gtk_sort_list_model_get_pending"

external set_sorter : t -> Gtk.Widget.t option -> unit = "ml_gtk_sort_list_model_set_sorter"

external set_section_sorter : t -> Gtk.Widget.t option -> unit = "ml_gtk_sort_list_model_set_section_sorter"

external set_model : t -> unit -> unit = "ml_gtk_sort_list_model_set_model"

external get_sorter : t -> Gtk.Widget.t = "ml_gtk_sort_list_model_get_sorter"

external get_section_sorter : t -> Gtk.Widget.t = "ml_gtk_sort_list_model_get_section_sorter"

