(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SortListModel *)

type t = Gtk.widget

(** Create a new SortListModel *)
external new_ : unit -> Gtk.widget option -> t = "ml_gtk_sort_list_model_new"

(* Properties *)

(** Get property: incremental *)
external get_incremental : t -> bool = "ml_gtk_sort_list_model_get_incremental"

(** Set property: incremental *)
external set_incremental : t -> bool -> unit = "ml_gtk_sort_list_model_set_incremental"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_sort_list_model_get_n_items"

(** Get property: pending *)
external get_pending : t -> int = "ml_gtk_sort_list_model_get_pending"

external set_sorter : t -> Gtk.widget option -> unit = "ml_gtk_sort_list_model_set_sorter"

external set_section_sorter : t -> Gtk.widget option -> unit = "ml_gtk_sort_list_model_set_section_sorter"

external get_sorter : t -> Gtk.widget = "ml_gtk_sort_list_model_get_sorter"

external get_section_sorter : t -> Gtk.widget = "ml_gtk_sort_list_model_get_section_sorter"

