(** A list model that sorts the elements of another model.

    The elements are sorted according to a [GtkSorter].

    The model is a stable sort. If two items compare equal according to the
    sorter, the one that appears first in the original model will also appear
    first after sorting.

    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [GtkMultiSorter] and appending the previous sorter to it.

    The model can be set up to do incremental sorting, so that sorting long
    lists doesn't block the UI. See [Gtk.SortListModel.set_incremental] for
    details.

    [GtkSortListModel] is a generic model and because of that it cannot take
    advantage of any external knowledge when sorting. If you run into
    performance issues with [GtkSortListModel], it is strongly recommended that
    you write your own sorting list model.

    [GtkSortListModel] allows sorting the items into sections. It implements
    [GtkSectionModel] and when [Gtk.SortListModel:section-sorter] is set, it
    will sort all items with that sorter and items comparing equal with it will
    be put into the same section. The [Gtk.SortListModel:sorter] will then be
    used to sort items inside their sections.

    Its methods, signals and properties are on {!class-type-sort_list_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Sort_list_model}. *)

(** The methods, signals and properties of a [GtkSortListModel]. *)
class type sort_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_pending : unit -> int
  method get_section_sorter : unit -> Sorter.sorter_t option
  method get_sorter : unit -> Sorter.sorter_t option
  method set_incremental : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_section_sorter : Sorter.sorter_t option -> unit
  method set_sorter : Sorter.sorter_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_sort_list_model : Raw.Sort_list_model.t
end

class sort_list_model : Raw.Sort_list_model.t -> sort_list_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Sort_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkSortListModel], give one already wrapped. *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Sorter.sorter_t option ->
  sort_list_model_t
