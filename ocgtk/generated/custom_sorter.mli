(** Sorts items via a callback function.

    Its methods, signals and properties are on {!class-type-custom_sorter_t}.
    The functions it is built on are in {!Ocgtk.Raw.Custom_sorter}. *)

(** The methods, signals and properties of a [CustomSorter]. *)
class type custom_sorter_t = object
  inherit Sorter.sorter_t
  method as_custom_sorter : Raw.Custom_sorter.t
end

class custom_sorter : Raw.Custom_sorter.t -> custom_sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Custom_sorter.t}. *)
