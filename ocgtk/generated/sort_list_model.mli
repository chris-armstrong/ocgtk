(** A list model that sorts the elements of another model.

    Its methods, signals and properties are on {!class-type-sort_list_model_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Sort_list_model}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SortListModel].}

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}
    - {{!Ocgtk.Section_model.class-type-section_model_t}Ocgtk.Section_model}

    A list model that sorts the elements of another model.

    The elements are sorted according to a [GtkSorter].

    The model is a stable sort. If two items compare equal according to the
    sorter, the one that appears first in the original model will also appear
    first after sorting.

    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [GtkMultiSorter] and appending the previous sorter to it.

    The model can be set up to do incremental sorting, so that sorting long
    lists doesn't block the UI. See
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-set_incremental}
     [Gtk.SortListModel.set_incremental]} for details.

    [GtkSortListModel] is a generic model and because of that it cannot take
    advantage of any external knowledge when sorting. If you run into
    performance issues with [GtkSortListModel], it is strongly recommended that
    you write your own sorting list model.

    [GtkSortListModel] allows sorting the items into sections. It implements
    [GtkSectionModel] and when
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-get_section_sorter}
     [Gtk.SortListModel:section-sorter]} is set, it will sort all items with
    that sorter and items comparing equal with it will be put into the same
    section. The
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-get_sorter}[Gtk.SortListModel:sorter]}
    will then be used to sort items inside their sections. *)
class type sort_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  (** {2:methods Methods} *)

  method get_incremental : unit -> bool
  (** Returns whether incremental sorting is enabled.

      See [Gtk.SortListModel.set_incremental]. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model currently sorted or [None] if none. *)

  method get_pending : unit -> int
  (** Estimates progress of an ongoing sorting operation.

      The estimate is the number of items that would still need to be sorted to
      finish the sorting operation if this was a linear algorithm. So this
      number is not related to how many items are already correctly sorted.

      If you want to estimate the progress, you can use code like this:

      {[
      pending = gtk_sort_list_model_get_pending self;
      model = gtk_sort_list_model_get_model self;
      progress = 1.0 - (pending / double MAX (1, g_list_model_get_n_items model))
      ]}

      If no sort operation is ongoing - in particular when
      [Gtk.SortListModel:incremental] is [false] - this function returns 0. *)

  method get_section_sorter : unit -> Sorter.sorter_t option
  (** Gets the section sorter that is used to sort items of [self] into
      sections. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Gets the sorter that is used to sort [self]. *)

  method set_incremental : bool -> unit
  (** Sets the sort model to do an incremental sort.

      When incremental sorting is enabled, the [GtkSortListModel] will not do a
      complete sort immediately, but will instead queue an idle handler that
      incrementally sorts the items towards their correct position. This of
      course means that items do not instantly appear in the right place. It
      also means that the total sorting time is a lot slower.

      When your filter blocks the UI while sorting, you might consider turning
      this on. Depending on your model and sorters, this may become interesting
      around 10,000 to 100,000 items.

      By default, incremental sorting is disabled.

      See [Gtk.SortListModel.get_pending] for progress information about an
      ongoing incremental sorting operation. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to be sorted.

      The [model]'s item type must conform to the item type of [self]. *)

  method set_section_sorter : Sorter.sorter_t option -> unit
  (** Sets a new section sorter on [self]. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Sets a new sorter on [self]. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_sort_list_model : Raw.Sort_list_model.t
end

class sort_list_model : Raw.Sort_list_model.t -> sort_list_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Sort_list_model.t}. *)

(** {1:description Description}

    A list model that sorts the elements of another model.

    The elements are sorted according to a [GtkSorter].

    The model is a stable sort. If two items compare equal according to the
    sorter, the one that appears first in the original model will also appear
    first after sorting.

    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [GtkMultiSorter] and appending the previous sorter to it.

    The model can be set up to do incremental sorting, so that sorting long
    lists doesn't block the UI. See
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-set_incremental}
     [Gtk.SortListModel.set_incremental]} for details.

    [GtkSortListModel] is a generic model and because of that it cannot take
    advantage of any external knowledge when sorting. If you run into
    performance issues with [GtkSortListModel], it is strongly recommended that
    you write your own sorting list model.

    [GtkSortListModel] allows sorting the items into sections. It implements
    [GtkSectionModel] and when
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-get_section_sorter}
     [Gtk.SortListModel:section-sorter]} is set, it will sort all items with
    that sorter and items comparing equal with it will be put into the same
    section. The
    {{!Ocgtk.Sort_list_model.class-type-sort_list_model_t.method-get_sorter}[Gtk.SortListModel:sorter]}
    will then be used to sort items inside their sections. *)

(** {1:constructors Constructors} *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Sorter.sorter_t option ->
  sort_list_model_t
(** Creates a new sort list model that uses the [sorter] to sort [model]. *)
