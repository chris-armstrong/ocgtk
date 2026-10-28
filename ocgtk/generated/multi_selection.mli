(** A selection model that allows selecting multiple elements.

    Its methods, signals and properties are on {!class-type-multi_selection_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Multi_selection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MultiSelection].}

    A selection model that allows selecting multiple elements. *)
class type multi_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  (** {2:methods Methods} *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Returns the underlying model of [self]. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [NULL], [self] will be empty. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_multi_selection : Raw.Multi_selection.t
end

class multi_selection : Raw.Multi_selection.t -> multi_selection_t
(** Wraps a raw handle of {!Ocgtk.Raw.Multi_selection.t}. *)

(** {1:constructors Constructors} *)

val new_ : Ocgio.List_model.list_model_t option -> multi_selection_t
(** Creates a new selection to handle [model]. *)
