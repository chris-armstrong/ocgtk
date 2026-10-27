(** Base class for filters that combine multiple filters.

    Its methods, signals and properties are on {!class-type-multi_filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Multi_filter}. *)

(** The methods, signals and properties of a [GtkMultiFilter]. *)
class type multi_filter_t = object
  inherit Filter.filter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : Filter.filter_t -> unit
  method remove : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_filter : Raw.Multi_filter.t
end

class multi_filter : Raw.Multi_filter.t -> multi_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Multi_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkMultiFilter], give one already wrapped. *)
