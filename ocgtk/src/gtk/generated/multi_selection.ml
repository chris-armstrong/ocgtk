(* GENERATED CODE - DO NOT EDIT *)
(* MultiSelection: MultiSelection *)

type t = [`multi_selection | `object_] Gobject.obj

(** Create a new MultiSelection *)
external new_ : Ocgtk_gio.Gio.Wrappers.List_model.t option -> t = "ml_gtk_multi_selection_new"

(* Methods *)
(** Sets the model that @self should wrap.

If @model is %NULL, @self will be empty. *)
external set_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit = "ml_gtk_multi_selection_set_model"

(** Returns the underlying model of @self. *)
external get_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option = "ml_gtk_multi_selection_get_model"

(* Properties *)

(** Get property: item-type *)
external get_item_type : t -> int = "ml_gtk_multi_selection_get_item_type"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_multi_selection_get_n_items"

