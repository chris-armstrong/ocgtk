(** Sorts items via a callback function.

    Its methods, signals and properties are on {!class-type-custom_sorter_t}.
    The functions it is built on are in {!Ocgtk.Raw.Custom_sorter}. *)

(** The methods, signals and properties of a [GtkCustomSorter]. *)
class type custom_sorter_t = object
  inherit Sorter.sorter_t
  method as_custom_sorter : Raw.Custom_sorter.t
end

class custom_sorter : Raw.Custom_sorter.t -> custom_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Custom_sorter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCustomSorter], give one already wrapped. *)
