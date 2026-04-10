(* GENERATED CODE - DO NOT EDIT *)
(* NoSelection: NoSelection *)

type t = [`no_selection | `object_] Gobject.obj

(** Create a new NoSelection *)
external new_ : Ocgtk_gio.Gio.Wrappers.List_model.t option -> t = "ml_gtk_no_selection_new"

(* Methods *)
(** Sets the model that @self should wrap.

If @model is %NULL, this model will be empty. *)
external set_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit = "ml_gtk_no_selection_set_model"

(** Gets the model that @self is wrapping. *)
external get_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option = "ml_gtk_no_selection_get_model"

(* Properties *)

(** Get property: item-type *)
external get_item_type : t -> int = "ml_gtk_no_selection_get_item_type"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_no_selection_get_n_items"

