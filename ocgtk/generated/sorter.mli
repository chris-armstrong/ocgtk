(** Describes sorting criteria for a [Gtk.SortListModel].

    Its primary user is [Gtk.SortListModel]

    The model will use a sorter to determine the order in which its items should
    appear by calling [Gtk.Sorter.compare] for pairs of items.

    Sorters may change their sorting behavior through their lifetime. In that
    case, they will emit the [Gtk.Sorter::changed] signal to notify that the
    sort order is no longer valid and should be updated by calling
    gtk_sorter_compare() again.

    GTK provides various pre-made sorter implementations for common sorting
    operations. [Gtk.ColumnView] has built-in support for sorting lists via the
    [Gtk.ColumnViewColumn:sorter] property, where the user can change the
    sorting by clicking on list headers.

    Of course, in particular for large lists, it is also possible to subclass
    [GtkSorter] and provide one's own sorter.

    Its methods, signals and properties are on {!class-type-sorter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Sorter}. *)

(** The methods, signals and properties of a [GtkSorter]. *)
class type sorter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.sorterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method changed : Enums.sorterchange -> unit

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Enums.ordering

  method get_order : unit -> Enums.sorterorder
  method as_sorter : Raw.Sorter.t
end

class sorter : Raw.Sorter.t -> sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Sorter.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSorter], give one already wrapped. *)
