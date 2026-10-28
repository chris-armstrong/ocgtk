(** A selection model that does not allow selecting anything.

    This model is meant to be used as a simple wrapper around a [GListModel]
    when a [GtkSelectionModel] is required.

    [GtkNoSelection] passes through sections from the underlying model.

    Its methods, signals and properties are on {!class-type-no_selection_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.No_selection}. *)

(** {b The methods, signals and properties of a [NoSelection].}

    A selection model that does not allow selecting anything.

    This model is meant to be used as a simple wrapper around a [GListModel]
    when a [GtkSelectionModel] is required.

    [GtkNoSelection] passes through sections from the underlying model. *)
class type no_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that [self] is wrapping. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [NULL], this model will be empty. *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  method as_no_selection : Raw.No_selection.t
end

class no_selection : Raw.No_selection.t -> no_selection_t
(** Wraps a raw handle of {!Ocgtk.Raw.No_selection.t}. *)

(** {2:constructors Constructors} *)

val new_ : Ocgio.List_model.list_model_t option -> no_selection_t
(** Creates a new selection to handle [model]. *)
