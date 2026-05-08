class type filter_t = object
  method on_changed :
    callback:(change:Gtk_enums.filterchange -> unit) ->
    Gobject.Signal.handler_id

  method changed : Gtk_enums.filterchange -> unit
  method get_strictness : unit -> Gtk_enums.filtermatch
  method match_ : [ `object_ ] Gobject.obj -> bool
  method as_filter : Filter.t
end

class filter : Filter.t -> filter_t
