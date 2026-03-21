(* GENERATED CODE - DO NOT EDIT *)
(* FlattenListModel: FlattenListModel *)

type t = [`flatten_list_model | `object_] Gobject.obj

(** Create a new FlattenListModel *)
external new_ : Ocgtk_gio.Gio.Wrappers.List_model.t option -> t = "ml_gtk_flatten_list_model_new"

(* Methods *)
(** Sets a new model to be flattened. *)
external set_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit = "ml_gtk_flatten_list_model_set_model"

(** Returns the model containing the item at the given position. *)
external get_model_for_item : t -> int -> Ocgtk_gio.Gio.Wrappers.List_model.t option = "ml_gtk_flatten_list_model_get_model_for_item"

(** Gets the model set via gtk_flatten_list_model_set_model(). *)
external get_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option = "ml_gtk_flatten_list_model_get_model"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_flatten_list_model_get_n_items"

