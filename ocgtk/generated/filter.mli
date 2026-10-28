(** Describes the filtering to be performed by a [Gtk.FilterListModel].

    The model will use the filter to determine if it should include items or not
    by calling [Gtk.Filter.match] for each item and only keeping the ones that
    the function returns true for.

    Filters may change what items they match through their lifetime. In that
    case, they will emit the [Gtk.Filter::changed] signal to notify that
    previous filter results are no longer valid and that items should be checked
    again via [Gtk.Filter.match].

    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.

    However, in particular for large lists or complex search methods, it is also
    possible to subclass [GtkFilter] and provide one's own filter.

    Its methods, signals and properties are on {!class-type-filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Filter}. *)

(** {b The methods, signals and properties of a [Filter].}

    Describes the filtering to be performed by a [Gtk.FilterListModel].

    The model will use the filter to determine if it should include items or not
    by calling [Gtk.Filter.match] for each item and only keeping the ones that
    the function returns true for.

    Filters may change what items they match through their lifetime. In that
    case, they will emit the [Gtk.Filter::changed] signal to notify that
    previous filter results are no longer valid and that items should be checked
    again via [Gtk.Filter.match].

    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.

    However, in particular for large lists or complex search methods, it is also
    possible to subclass [GtkFilter] and provide one's own filter. *)
class type filter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.filterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the filter changed.

      Users of the filter should then check items again via [Gtk.Filter.match].

      [GtkFilterListModel] handles this signal automatically.

      Depending on the [change] parameter, not all items need to be checked, but
      only some. Refer to the [Gtk.FilterChange] documentation for details. *)

  method changed : Enums.filterchange -> unit
  (** Notifies all users of the filter that it has changed.

      This emits the [Gtk.Filter::changed] signal. Users of the filter should
      then check items again via [Gtk.Filter.match].

      Depending on the [change] parameter, not all items need to be changed, but
      only some. Refer to the [Gtk.FilterChange] documentation for details.

      This function is intended for implementers of [GtkFilter] subclasses and
      should not be called from other functions. *)

  method get_strictness : unit -> Enums.filtermatch
  (** Gets the known strictness of a filter.

      If the strictness is not known, [Gtk.FilterMatch.some] is returned.

      This value may change after emission of the [Gtk.Filter::changed] signal.

      This function is meant purely for optimization purposes. Filters can
      choose to omit implementing it, but [GtkFilterListModel] uses it. *)

  method match_ : [ `object_ ] Gobject.obj -> bool
  (** Checks if the given [item] is matched by the filter or not. *)

  method as_filter : Raw.Filter.t
end

class filter : Raw.Filter.t -> filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Filter.t}. *)
