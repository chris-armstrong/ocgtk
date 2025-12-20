(* GENERATED CODE - DO NOT EDIT *)
(* Sorter: Sorter *)

type t = [`sorter | `object_] Gobject.obj

(* Methods *)
(** Gets the order that @self conforms to.

See [enum@Gtk.SorterOrder] for details
of the possible return values.

This function is intended to allow optimizations. *)
external get_order : t -> Gtk_enums.sorterorder = "ml_gtk_sorter_get_order"

(** Notifies all users of the sorter that it has changed.

This emits the [signal@Gtk.Sorter::changed] signal. Users
of the sorter should then update the sort order via
[method@Gtk.Sorter.compare].

Depending on the @change parameter, it may be possible to
update the sort order without a full resorting. Refer to
the [enum@Gtk.SorterChange] documentation for details.

This function is intended for implementers of `GtkSorter`
subclasses and should not be called from other functions. *)
external changed : t -> Gtk_enums.sorterchange -> unit = "ml_gtk_sorter_changed"

