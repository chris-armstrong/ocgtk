(* GENERATED CODE - DO NOT EDIT *)
(* Sorter: Sorter *)

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
    [GtkSorter] and provide one's own sorter. *)

type t = [ `sorter | `object_ ] Gobject.obj

(* Methods *)

external get_order : t -> Gtk_enums.sorterorder = "ml_gtk_sorter_get_order"
(** Gets the order that [self] conforms to.

    See [Gtk.SorterOrder] for details of the possible return values.

    This function is intended to allow optimizations. *)

external compare :
  t ->
  [ `object_ ] Gobject.obj ->
  [ `object_ ] Gobject.obj ->
  Gtk_enums.ordering = "ml_gtk_sorter_compare"
(** Compares two given items according to the sort order implemented by the
    sorter.

    Sorters implement a partial order:

    - It is reflexive, ie a = a
    - It is antisymmetric, ie if a < b and b < a, then a = b
    - It is transitive, ie given any 3 items with a ≤ b and b ≤ c, then a ≤ c

    The sorter may signal it conforms to additional constraints via the return
    value of [Gtk.Sorter.get_order]. *)

external changed : t -> Gtk_enums.sorterchange -> unit = "ml_gtk_sorter_changed"
(** Notifies all users of the sorter that it has changed.

    This emits the [Gtk.Sorter::changed] signal. Users of the sorter should then
    update the sort order via [Gtk.Sorter.compare].

    Depending on the [change] parameter, it may be possible to update the sort
    order without a full resorting. Refer to the [Gtk.SorterChange]
    documentation for details.

    This function is intended for implementers of [GtkSorter] subclasses and
    should not be called from other functions. *)

let on_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let change =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.sorterchange_of_int (Gobject.Value.get_enum_int v)
        in
        callback ~change)
  in
  Gobject.Signal.connect obj ~name:"changed" ~callback:closure
    ~after:(Option.value after ~default:false)
