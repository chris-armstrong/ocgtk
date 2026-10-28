(** Describes sorting criteria for a [Gtk.SortListModel].

    Its methods, signals and properties are on {!class-type-sorter_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Sorter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Sorter].}

    Inherits from: [GObject.Object]

    Describes sorting criteria for a [Gtk.SortListModel].

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
class type sorter_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool ->
    callback:(change:Enums.sorterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the sorter changed.

      Users of the sorter should then update the sort order again via
      gtk_sorter_compare().

      [Gtk.SortListModel] handles this signal automatically.

      Depending on the [change] parameter, it may be possible to update the sort
      order without a full resorting. Refer to the [Gtk.SorterChange]
      documentation for details. *)

  (** {2:methods Methods} *)

  method changed : Enums.sorterchange -> unit
  (** Notifies all users of the sorter that it has changed.

      This emits the [Gtk.Sorter::changed] signal. Users of the sorter should
      then update the sort order via [Gtk.Sorter.compare].

      Depending on the [change] parameter, it may be possible to update the sort
      order without a full resorting. Refer to the [Gtk.SorterChange]
      documentation for details.

      This function is intended for implementers of [GtkSorter] subclasses and
      should not be called from other functions. *)

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Enums.ordering
  (** Compares two given items according to the sort order implemented by the
      sorter.

      Sorters implement a partial order:

      - It is reflexive, ie a = a
      - It is antisymmetric, ie if a < b and b < a, then a = b
      - It is transitive, ie given any 3 items with a ≤ b and b ≤ c, then a ≤ c

      The sorter may signal it conforms to additional constraints via the return
      value of [Gtk.Sorter.get_order]. *)

  method get_order : unit -> Enums.sorterorder
  (** Gets the order that [self] conforms to.

      See [Gtk.SorterOrder] for details of the possible return values.

      This function is intended to allow optimizations. *)

  (** {2:conversions Conversions} *)

  method as_sorter : Raw.Sorter.t
end

class sorter : Raw.Sorter.t -> sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Sorter.t}. *)

(** {1:description Description}

    Describes sorting criteria for a [Gtk.SortListModel].

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

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
