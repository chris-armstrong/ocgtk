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

(** The methods, signals and properties of a [GtkFilter]. *)
class type filter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.filterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method changed : Enums.filterchange -> unit
  method get_strictness : unit -> Enums.filtermatch
  method match_ : [ `object_ ] Gobject.obj -> bool
  method as_filter : Raw.Filter.t
end

class filter : Raw.Filter.t -> filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Filter.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFilter], give one already wrapped. *)
