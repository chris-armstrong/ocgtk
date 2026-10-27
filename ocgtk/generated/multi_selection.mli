(** A selection model that allows selecting multiple elements.

    Its methods, signals and properties are on {!class-type-multi_selection_t}.
    The functions it is built on are in {!Ocgtk.Raw.Multi_selection}. *)

(** The methods, signals and properties of a [GtkMultiSelection]. *)
class type multi_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_selection : Raw.Multi_selection.t
end

class multi_selection : Raw.Multi_selection.t -> multi_selection_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Multi_selection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMultiSelection], give one already wrapped. *)

val new_ : Ocgio.List_model.list_model_t option -> multi_selection_t
