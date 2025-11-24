(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FilterListModel *)

type t = Gtk.widget

(** Create a new FilterListModel *)
external new_ : unit -> Gtk.widget option -> t = "ml_gtk_filter_list_model_new"

(* Properties *)

(** Get property: incremental *)
external get_incremental : t -> bool = "ml_gtk_filter_list_model_get_incremental"

(** Set property: incremental *)
external set_incremental : t -> bool -> unit = "ml_gtk_filter_list_model_set_incremental"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_filter_list_model_get_n_items"

(** Get property: pending *)
external get_pending : t -> int = "ml_gtk_filter_list_model_get_pending"

external set_filter : t -> Gtk.widget option -> unit = "ml_gtk_filter_list_model_set_filter"

external get_filter : t -> Gtk.widget = "ml_gtk_filter_list_model_get_filter"

