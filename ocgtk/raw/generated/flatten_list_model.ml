(* GENERATED CODE - DO NOT EDIT *)
(* FlattenListModel: FlattenListModel *)

(** A list model that concatenates other list models.

    [GtkFlattenListModel] takes a list model containing list models, and
    flattens it into a single model. Each list model becomes a section in the
    single model.

    The class built on this module is in {!Ocgtk.Flatten_list_model}. *)

type t = [ `flatten_list_model | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_flatten_list_model_get_type"

external new_ : Ocgio_raw.List_model.t option -> t
  = "ml_gtk_flatten_list_model_new"
(** Creates a new [GtkFlattenListModel] that flattens [list]. *)

(* Methods *)

external set_model : t -> Ocgio_raw.List_model.t option -> unit
  = "ml_gtk_flatten_list_model_set_model"
(** Sets a new model to be flattened. *)

external get_model_for_item : t -> int -> Ocgio_raw.List_model.t option
  = "ml_gtk_flatten_list_model_get_model_for_item"
(** Returns the model containing the item at the given position. *)

external get_model : t -> Ocgio_raw.List_model.t option
  = "ml_gtk_flatten_list_model_get_model"
(** Gets the model set via gtk_flatten_list_model_set_model(). *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_flatten_list_model_get_item_type"
(** The type of items. See [Gio.ListModel.get_item_type]. *)

external get_n_items : t -> int = "ml_gtk_flatten_list_model_get_n_items"
(** The number of items. See [Gio.ListModel.get_n_items]. *)
