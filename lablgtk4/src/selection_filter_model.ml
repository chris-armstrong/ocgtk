(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SelectionFilterModel *)

type t = Gtk.widget

(** Create a new SelectionFilterModel *)
external new_ : Gtk.widget option -> t = "ml_gtk_selection_filter_model_new"

(* Properties *)

(** Sets the model to be filtered.

Note that GTK makes no effort to ensure that @model conforms to
the item type of @self. It assumes that the caller knows what they
are doing and have set up an appropriate filter to ensure that item
types match. *)
external set_model : t -> Gtk.widget option -> unit = "ml_gtk_selection_filter_model_set_model"

(** Gets the model currently filtered or %NULL if none. *)
external get_model : t -> Gtk.widget = "ml_gtk_selection_filter_model_get_model"

