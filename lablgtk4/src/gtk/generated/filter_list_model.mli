(* GENERATED CODE - DO NOT EDIT *)
(* FilterListModel: FilterListModel *)

type t = [`filter_list_model | `object_] Gobject.obj

(** Create a new FilterListModel *)
external new_ : unit -> Filter.t option -> t = "ml_gtk_filter_list_model_new"

(* Properties *)

(** Get property: incremental *)
external get_incremental : t -> bool = "ml_gtk_filter_list_model_get_incremental"

(** Set property: incremental *)
external set_incremental : t -> bool -> unit = "ml_gtk_filter_list_model_set_incremental"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_filter_list_model_get_n_items"

(** Get property: pending *)
external get_pending : t -> int = "ml_gtk_filter_list_model_get_pending"

(** Sets the filter used to filter items. *)
external set_filter : t -> Filter.t option -> unit = "ml_gtk_filter_list_model_set_filter"

(** Gets the `GtkFilter` currently set on @self. *)
external get_filter : t -> Filter.t option = "ml_gtk_filter_list_model_get_filter"

