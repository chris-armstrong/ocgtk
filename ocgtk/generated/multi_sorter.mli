(** Combines multiple sorters by trying them in turn.

    If the first sorter compares two items as equal, the second is tried next,
    and so on.

    Its methods, signals and properties are on {!class-type-multi_sorter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Multi_sorter}. *)

(** The methods, signals and properties of a [GtkMultiSorter]. *)
class type multi_sorter_t = object
  inherit Sorter.sorter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  method append : Sorter.sorter_t -> unit
  (** Add [sorter] to [self] to use for sorting at the end.

      [self] will consult all existing sorters before it will sort with the
      given [sorter]. *)

  method remove : int -> unit
  (** Removes the sorter at the given [position] from the list of sorter used by
      [self].

      If [position] is larger than the number of sorters, nothing happens. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_sorter : Raw.Multi_sorter.t
end

class multi_sorter : Raw.Multi_sorter.t -> multi_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Multi_sorter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkMultiSorter], give one already wrapped. *)

val new_ : unit -> multi_sorter_t
