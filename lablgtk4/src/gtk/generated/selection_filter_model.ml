(* GENERATED CODE - DO NOT EDIT *)
(* SelectionFilterModel: SelectionFilterModel *)

type t = [`selection_filter_model | `object_] Gobject.obj

(** Create a new SelectionFilterModel *)
external new_ : Selection_model.t option -> t = "ml_gtk_selection_filter_model_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_selection_filter_model_get_n_items"

(** Sets the model to be filtered.

Note that GTK makes no effort to ensure that @model conforms to
the item type of @self. It assumes that the caller knows what they
are doing and have set up an appropriate filter to ensure that item
types match. *)
external set_model : t -> Selection_model.t option -> unit = "ml_gtk_selection_filter_model_set_model"

(** Gets the model currently filtered or %NULL if none. *)
external get_model : t -> Selection_model.t option = "ml_gtk_selection_filter_model_get_model"

