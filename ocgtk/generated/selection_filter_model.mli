(** A list model that presents the selection from a [GtkSelectionModel].

    Its methods, signals and properties are on
    {!class-type-selection_filter_model_t}. The functions it is built on are in
    {!Ocgtk.Raw.Selection_filter_model}. *)

(** The methods, signals and properties of a [GtkSelectionFilterModel]. *)
class type selection_filter_model_t = object
  inherit Ocgio.List_model.list_model_t
  method get_model : unit -> Selection_model.selection_model_t option
  method set_model : Selection_model.selection_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_selection_filter_model : Raw.Selection_filter_model.t
end

class selection_filter_model :
  Raw.Selection_filter_model.t ->
  selection_filter_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Selection_filter_model.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkSelectionFilterModel], give one already wrapped.
*)

val new_ : Selection_model.selection_model_t option -> selection_filter_model_t
