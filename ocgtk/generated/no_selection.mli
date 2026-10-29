(** A selection model that does not allow selecting anything.

    Its methods, signals and properties are on {!class-type-no_selection_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.No_selection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NoSelection].}

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}
    - {{!Ocgtk.Section_model.class-type-section_model_t}Ocgtk.Section_model}
    - {{!Ocgtk.Selection_model.class-type-selection_model_t}Ocgtk.Selection_model}

    A selection model that does not allow selecting anything.

    This model is meant to be used as a simple wrapper around a [GListModel]
    when a [GtkSelectionModel] is required.

    [GtkNoSelection] passes through sections from the underlying model. *)
class type no_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that [self] is wrapping. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [NULL], this model will be empty. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_no_selection : Raw.No_selection.t
end

class no_selection : Raw.No_selection.t -> no_selection_t
(** Wraps a raw handle of {!Ocgtk.Raw.No_selection.t}. *)

(** {1:description Description}

    A selection model that does not allow selecting anything.

    This model is meant to be used as a simple wrapper around a [GListModel]
    when a [GtkSelectionModel] is required.

    [GtkNoSelection] passes through sections from the underlying model. *)

(** {1:constructors Constructors} *)

val new_ : Ocgio.List_model.list_model_t option -> no_selection_t
(** Creates a new selection to handle [model]. *)
