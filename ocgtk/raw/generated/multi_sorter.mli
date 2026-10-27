(* GENERATED CODE - DO NOT EDIT *)
(* MultiSorter: MultiSorter *)

(** Combines multiple sorters by trying them in turn.

    If the first sorter compares two items as equal, the second is tried next,
    and so on.

    The class built on this module is in {!Ocgtk.Multi_sorter}. *)

type t = [ `multi_sorter | `sorter | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_multi_sorter_get_type"

external new_ : unit -> t = "ml_gtk_multi_sorter_new"
(** Creates a new multi sorter.

    This sorter compares items by trying each of the sorters in turn, until one
    returns non-zero. In particular, if no sorter has been added to it, it will
    always compare items as equal. *)

(* Methods *)

external remove : t -> int -> unit = "ml_gtk_multi_sorter_remove"
(** Removes the sorter at the given [position] from the list of sorter used by
    [self].

    If [position] is larger than the number of sorters, nothing happens. *)

external append : t -> Sorter.t -> unit = "ml_gtk_multi_sorter_append"
(** Add [sorter] to [self] to use for sorting at the end.

    [self] will consult all existing sorters before it will sort with the given
    [sorter]. *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_multi_sorter_get_item_type"
(** The type of items. See [Gio.ListModel.get_item_type]. *)

external get_n_items : t -> int = "ml_gtk_multi_sorter_get_n_items"
(** The number of items. See [Gio.ListModel.get_n_items]. *)
