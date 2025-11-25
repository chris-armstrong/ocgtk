(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Filter *)

type t = Gtk.widget

(** Gets the known strictness of @filters.

If the strictness is not known, %GTK_FILTER_MATCH_SOME is returned.

This value may change after emission of the [signal@Gtk.Filter::changed]
signal.

This function is meant purely for optimization purposes, filters can
choose to omit implementing it, but `GtkFilterListModel` uses it. *)
external get_strictness : t -> Gtk_enums.filtermatch = "ml_gtk_filter_get_strictness"

(** Notifies all users of the filter that it has changed.

This emits the [signal@Gtk.Filter::changed] signal. Users
of the filter should then check items again via
[method@Gtk.Filter.match].

Depending on the @change parameter, not all items need to
be changed, but only some. Refer to the [enum@Gtk.FilterChange]
documentation for details.

This function is intended for implementers of `GtkFilter`
subclasses and should not be called from other functions. *)
external changed : t -> Gtk_enums.filterchange -> unit = "ml_gtk_filter_changed"

