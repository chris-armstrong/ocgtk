(** A list model that concatenates other list models.

    Its methods, signals and properties are on
    {!class-type-flatten_list_model_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Flatten_list_model}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FlattenListModel].}

    A list model that concatenates other list models.

    [GtkFlattenListModel] takes a list model containing list models, and
    flattens it into a single model. Each list model becomes a section in the
    single model. *)
class type flatten_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model set via gtk_flatten_list_model_set_model(). *)

  method get_model_for_item : int -> Ocgio.List_model.list_model_t option
  (** Returns the model containing the item at the given position. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets a new model to be flattened. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_flatten_list_model : Raw.Flatten_list_model.t
end

class flatten_list_model : Raw.Flatten_list_model.t -> flatten_list_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Flatten_list_model.t}. *)

(** {1:description Description}

    A list model that concatenates other list models.

    [GtkFlattenListModel] takes a list model containing list models, and
    flattens it into a single model. Each list model becomes a section in the
    single model. *)

(** {1:constructors Constructors} *)

val new_ : Ocgio.List_model.list_model_t option -> flatten_list_model_t
(** Creates a new [GtkFlattenListModel] that flattens [list]. *)
