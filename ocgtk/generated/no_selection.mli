(** A selection model that does not allow selecting anything.

    This model is meant to be used as a simple wrapper around a [GListModel]
    when a [GtkSelectionModel] is required.

    [GtkNoSelection] passes through sections from the underlying model.

    Its methods, signals and properties are on {!class-type-no_selection_t}. The
    functions it is built on are in {!Ocgtk.Raw.No_selection}. *)

(** The methods, signals and properties of a [GtkNoSelection]. *)
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
  method n_items : int
  method as_no_selection : Raw.No_selection.t
end

class no_selection : Raw.No_selection.t -> no_selection_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.No_selection.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNoSelection], give one already wrapped. *)

val new_ : Ocgio.List_model.list_model_t option -> no_selection_t
