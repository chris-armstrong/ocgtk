(* GENERATED CODE - DO NOT EDIT *)
(* SortListModel: SortListModel *)

type t = [`sort_list_model | `object_] Gobject.obj

(** Create a new SortListModel *)
external new_ : unit -> Sorter.t option -> t = "ml_gtk_sort_list_model_new"

(* Properties *)

(** Get property: incremental *)
external get_incremental : t -> bool = "ml_gtk_sort_list_model_get_incremental"

(** Set property: incremental *)
external set_incremental : t -> bool -> unit = "ml_gtk_sort_list_model_set_incremental"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_sort_list_model_get_n_items"

(** Get property: pending *)
external get_pending : t -> int = "ml_gtk_sort_list_model_get_pending"

(** Sets a new sorter on @self. *)
external set_sorter : t -> Sorter.t option -> unit = "ml_gtk_sort_list_model_set_sorter"

(** Sets a new section sorter on @self. *)
external set_section_sorter : t -> Sorter.t option -> unit = "ml_gtk_sort_list_model_set_section_sorter"

(** Gets the sorter that is used to sort @self. *)
external get_sorter : t -> Sorter.t option = "ml_gtk_sort_list_model_get_sorter"

(** Gets the section sorter that is used to sort items of @self into
sections. *)
external get_section_sorter : t -> Sorter.t option = "ml_gtk_sort_list_model_get_section_sorter"

