(** Determines whether to include items with a callback.

    Its methods, signals and properties are on {!class-type-custom_filter_t}.
    The functions it is built on are in {!Ocgtk.Raw.Custom_filter}. *)

(** The methods, signals and properties of a [GtkCustomFilter]. *)
class type custom_filter_t = object
  inherit Filter.filter_t
  method as_custom_filter : Raw.Custom_filter.t
end

class custom_filter : Raw.Custom_filter.t -> custom_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Custom_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCustomFilter], give one already wrapped. *)
