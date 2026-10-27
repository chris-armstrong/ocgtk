(** A selection model that allows selecting a single item.

    Note that the selection is {i persistent} -- if the selected item is removed
    and re-added in the same [Gio.ListModel::items-changed] emission, it stays
    selected. In particular, this means that changing the sort order of an
    underlying sort model will preserve the selection.

    Its methods, signals and properties are on {!class-type-single_selection_t}.
    The functions it is built on are in {!Ocgtk.Raw.Single_selection}. *)

(** The methods, signals and properties of a [GtkSingleSelection]. *)
class type single_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t
  method get_autoselect : unit -> bool
  method get_can_unselect : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_selected : unit -> int
  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  method set_autoselect : bool -> unit
  method set_can_unselect : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_selected : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_single_selection : Raw.Single_selection.t
end

class single_selection : Raw.Single_selection.t -> single_selection_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Single_selection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkSingleSelection], give one already wrapped. *)

val new_ : Ocgio.List_model.list_model_t option -> single_selection_t
