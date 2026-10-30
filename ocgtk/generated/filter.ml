class type filter_t = object
  (** {2:signals Signals} *)

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

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_filter : Raw.Filter.t
end

(* High-level class for Filter *)
class filter (obj : Raw.Filter.t) : filter_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Filter.on_changed ~after self#as_filter ~callback

    method changed : Enums.filterchange -> unit =
      fun change -> Raw.Filter.changed obj change

    method get_strictness : unit -> Enums.filtermatch =
      fun () -> Raw.Filter.get_strictness obj

    method match_ : [ `object_ ] Gobject.obj -> bool =
      fun item -> Raw.Filter.match_ obj item

    method as_filter = obj
  end
