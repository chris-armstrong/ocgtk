(** Combines multiple sorters by trying them in turn.

    If the first sorter compares two items as equal, the second is tried next,
    and so on.

    Its methods, signals and properties are on {!class-type-multi_sorter_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Multi_sorter}. *)

(** {b The methods, signals and properties of a [MultiSorter].}

    Combines multiple sorters by trying them in turn.

    If the first sorter compares two items as equal, the second is tried next,
    and so on. *)
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
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  method as_multi_sorter : Raw.Multi_sorter.t
end

class multi_sorter : Raw.Multi_sorter.t -> multi_sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Multi_sorter.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> multi_sorter_t
(** Creates a new multi sorter.

    This sorter compares items by trying each of the sorters in turn, until one
    returns non-zero. In particular, if no sorter has been added to it, it will
    always compare items as equal. *)
