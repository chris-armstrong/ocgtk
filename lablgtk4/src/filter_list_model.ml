(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FilterListModel *)

type t = Gtk.widget

external new_ : unit -> Gtk.widget option -> t = "ml_gtk_filter_list_model_new"

(* Properties *)

external get_incremental : t -> bool = "ml_gtk_filter_list_model_get_incremental"

external set_incremental : t -> bool -> unit = "ml_gtk_filter_list_model_set_incremental"

external get_n_items : t -> int = "ml_gtk_filter_list_model_get_n_items"

external get_pending : t -> int = "ml_gtk_filter_list_model_get_pending"

external set_filter : t -> Gtk.widget option -> unit = "ml_gtk_filter_list_model_set_filter"

external get_filter : t -> Gtk.widget = "ml_gtk_filter_list_model_get_filter"

